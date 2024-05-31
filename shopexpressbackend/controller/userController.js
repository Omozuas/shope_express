const User=require('../models/user_model');
const bcrypt = require('bcrypt');
const asynchandler=require('express-async-handler');
const jwtToken = require('../config/jwtToken');
const jwt = require("jsonwebtoken");
const { validateMongodbId } = require('../utils/validatemongodb');


class UserController{
    static  createUser = asynchandler(async (req,res)=>{
        console.log({
          firstname:req.body.firstname,
        lastname:req.body.lastname,
        mobile:req.body.mobile,
        email:req.body.email,
        })
       const isExisting = await User.findOne({ email: req.body.email });
    
       if (isExisting) {
        throw new Error('Email Already Exists')
          //  return res.status(400).json({ message:'Email is already taken by another user',success:false});
        }
       const hashedPassword = await bcrypt.hash(req.body.password,10);
       const newUser=new User({
        firstname:req.body.firstname,
        lastname:req.body.lastname,
        mobile:req.body.mobile,
        email:req.body.email,
        password:hashedPassword
       });
       await newUser.save();
       return res.status(200).json({newUser,message:'SigUp successful',success:true});

    });
    static loginUser = asynchandler(async(req,res)=>{

        const isExisting = await User.findOne({ email: req.body.email })
        if (!isExisting) {
            throw new Error('Wrong credentials. Try again!')

          }
          const comparePass = await bcrypt.compare(req.body.password, isExisting.password )
        if (!comparePass) {
     
            throw new Error('Wrong credentials. Try again!')
        }
        const refreshToken=jwtToken.generateRefreshToken(isExisting?.id);
        const updateuser=await User.findByIdAndUpdate(isExisting.id,{
            refreshToken:refreshToken
        },{new:true})
        res.cookie("refreshToken",refreshToken,{
            httpOnly:true,
            maxAge:72*60*60*1000,
        });
      return res.status(200).json({ 
            role: isExisting?.role,
            token:jwtToken.generateToken(isExisting?.id),
            message:"login succesful",
            success:true });
    });
    static  genRefreshToken = asynchandler(async(req,res)=>{
        const cookie = req.cookies;
       if(!cookie?.refreshToken) throw new Error("No Refresh Token In Cookies")
        const refreshToken =cookie.refreshToken;
        const user=await User.findOne({refreshToken});
        if(!user) throw new Error("No rRefresh Token in Db");
        jwt.verify(refreshToken, process.env.JWT_SECRET,(err,decode)=>{
            if(err||user.id !==decode.id){
                throw new Error("something wrong with refresh token");
            }
            const accessToken=jwtToken.generateToken(user.id)
            res.status(200).json({accessToken});
        })
       
    });
    static  logout = asynchandler(async(req,res)=>{
        const cookie = req.cookies;
       if(!cookie?.refreshToken) throw new Error("No Refresh Token In Cookies")
        const refreshToken = cookie.refreshToken;
        const user=await User.findOne({refreshToken});
        if(!user){
            res.clearCookie("refreshToken",{
                httpOnly:true,
                secure:true
            });
            return   res.sendStatus(204);//forbidden
        }
      
        await User.findOneAndUpdate({refreshToken:refreshToken},{
            refreshToken:"",
        });
        res.clearCookie("refreshToken",{
            httpOnly:true,
            secure:true
        });
        return  res.sendStatus(204);//forbidden
       
    });
    static getUsers = asynchandler(async(req,res)=>{
        const users =await User.find({});
   
      if (!users) {
        throw new Error('Users not found');
      }
        res.status(200).json(users);
    });
    static getaUserbyId = asynchandler(async(req,res)=>{

        const { id } = req.user;
        validateMongodbId(id);
        const user = await User.findById(id);
   
      if (!user) {
        throw new Error('User not found');
      }
        res.status(200).json(user);
    });
    static deleteaUserbyId = asynchandler(async(req,res)=>{

        const { id } = req.user;
        validateMongodbId(id);
        const user = await User.findByIdAndDelete(id);
   
      if (!user) {
        throw new Error('User not found');
      }
      res.status(200).json({message:'User deleted'});
    });
    static updateUserbyId = asynchandler(async(req,res)=>{

        const { id } = req.user;
       validateMongodbId(id);
        const user = await User.findByIdAndUpdate(id,{
            firstname:req?.body?.firstname,
            lastname:req?.body?.lastname,
            mobile:req?.body?.mobile,
            email:req?.body?.email
        },{new:true});
   
      if (!user) {
        throw new Error('User not found');
      }
        res.status(200).json(user);
    });
    static blockUserbyId = asynchandler(async(req,res)=>{

        const { id } = req.params;
        validateMongodbId(id)
        const user = await User.findByIdAndUpdate(id,{
            
            isBlocked:true
        },{new:true});
   
      if (!user) {
        throw new Error('User not found');
      }
      res.status(200).json({message:'User blocked'});
    });
    static unblockUserbyId = asynchandler(async(req,res)=>{

        const { id } = req.params;
        validateMongodbId(id)
        const user = await User.findByIdAndUpdate(id,{
            isBlocked:false
        },{new:true});
   
      if (!user) {
        throw new Error('User not found');
      }
        res.status(200).json({message:'User Unblocked'});
    });
}
module.exports=UserController;