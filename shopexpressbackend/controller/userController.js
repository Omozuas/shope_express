const User=require('../models/user_model');
const Cart=require('../models/cart_model');
const Product=require('../models/product_model');
const Coupon=require('../models/cupon_modle');
const Order=require('../models/order_model');
const bcrypt = require('bcrypt');
const uniqid=require('uniqid');
const asynchandler=require('express-async-handler');
const jwtToken = require('../config/jwtToken');
const jwt = require("jsonwebtoken");
const cloudinary=require("../config/cloudnary");
const { validateMongodbId } = require('../utils/validatemongodb');
const crypto=require('crypto');
const Email=require('../controller/emailController');
const otpgen= require('otp-generator');
const fs=require('fs');

class UserController{
    static  createUser = asynchandler(async (req,res)=>{
       
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
        password:hashedPassword,
        profileImg:req?.body?.profileImg
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
            refreshToken:refreshToken,
            isLogin:true
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
        const cookie = req.user;
       if(!cookie) throw new Error("No Refresh Token In Cookies")
        const refreshToken =cookie.id;
        const user= await User.findById(refreshToken);
        if(!user) throw new Error("No rRefresh Token in Db");
        jwt.verify(user.refreshToken, process.env.JWT_SECRET,(err,decode)=>{
            if(err||user.id !==decode.id){
                throw new Error("something wrong with refresh token");
            }
            const accessToken=jwtToken.generateToken(user.id)
            res.status(200).json({accessToken});
        })
       
    });
    static  logout = asynchandler(async(req,res)=>{
        const cookie = req.user
        
       if(!cookie) throw new Error("No Refresh Token In Cookies")
      
        const user=await User.findById(cookie.id);
        if(!user){
            res.clearCookie("refreshToken",{
                httpOnly:true,
                secure:true
            });
            return   res.sendStatus(204);//forbidden
        }
      
        await User.findOneAndUpdate({refreshToken:user.refreshToken},{
            refreshToken:"",
            isLogin:false
        });
        res.clearCookie("refreshToken",{
            httpOnly:true,
            secure:true
        });
      
        res.status(200).json({message:'logout successful',success:true});
         
       
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
      console.log(req.file);
        const { id } = req.user;
        if (req.file.length > 1) {
          throw new Error('Cannot upload more than 1 image');
        }
        const uploader= async(path) => await cloudinary.uploads(path,"ProfileImages")
        
        const files=req.file
 
        const{path}=files
      
        const newPath=await uploader(path)
        const url=newPath.url;
    
        fs.unlinkSync(path)
       validateMongodbId(id);
        const user = await User.findByIdAndUpdate(id,{
            firstname:req?.body?.firstname,
            lastname:req?.body?.lastname,
            mobile:req?.body?.mobile,
            email:req?.body?.email,
            profileImg: url
        },{new:true});
   
      if (!user) {
        throw new Error('User not found');
      }
        res.status(200).json({user,message:'profile Updated',success:true});
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
    static updateUserPasswordbyId = asynchandler(async(req,res)=>{

      const { id } = req.user;
      const password =req.body.password;
      const hashedPassword = await bcrypt.hash(password,10) 
      const resetToken= crypto.randomBytes(32).toString("hex");
     validateMongodbId(id);
      const user = await User.findById(id);

      if(password){
        user.passwordResetToken=crypto.createHash("sha256").update(resetToken).digest("hex");
        user.passwordResetExpires=Date.now()+30*60*1000//10 mins
        user.password=hashedPassword;
        const updatPassword=await user.save();
        res.status(200).json({updatPassword,message:'password changed',success:true});
      }else{
        res.json(user);
      }
 
   
     
    });
    static forgotPassword = asynchandler(async(req,res)=>{

    const email = req.body.email;
    const user = await User.findOne({email});
    if (!user)throw new Error("User not found")
      const otp=otpgen.generate(
        4,{
            digits:true,
            upperCaseAlphabets:false,
            specialChars:false,
            lowerCaseAlphabets:false
        }
    );
    try{
      user.passwordResetToken=crypto.createHash("sha256").update(otp).digest("hex");
      user.passwordResetExpires=Date.now()+30*60*1000//10 mins
      await user.save();
      const restUrl=`<p>Dear Customer, this is the onetime PIN for  registring <b>DO NOT DISCLOSE</b></p><p style="color:tomato; font-size:25px; letter-spacing:2px"><b>${otp}</b></p><p>this code<b>expires in 10 min</b>.</p>`;
      const data={
        to:email,
        text:"Hello",
        subject: "Confirm your OTP",
        html:restUrl
      }
     Email.sendEmail(data);
      res.status(200).json({otp,message:'you will recive an OTP mail',success:true});
    }catch(error){
      throw new Error(error)
    }

 
   
    });
    static resetPassword = asynchandler(async(req,res)=>{

    const password = req.body.password;
    const otp = req.body.otp;
    const hashedPassword = await bcrypt.hash(password,10) 
    const ResetToken=crypto.createHash("sha256").update(otp).digest("hex");
    const user = await User.findOne({
      passwordResetToken:ResetToken,
      passwordResetExpires:{$gt:Date.now()}
    });
    if (!user)throw new Error("OTP Expired");
      user.password=hashedPassword;
      user.passwordResetToken=undefined;
      user.passwordResetExpires=undefined
      await user.save();
      res.status(200).json({message:'password changed',success:true});
   
   
    });
    static getWishList=asynchandler(async(req,res)=>{
      try {
        
         const {_id}=req.user
         const findUser=await User.findById(_id).populate("whislist")
         res.json(findUser);

      } catch (error) {
        throw new Error(error)
      }
    });
    static saveAddress=asynchandler(async(req,res)=>{
      try {
        
         const {id}=req.user
         console.log(id)
         validateMongodbId(id);
        const user = await User.findByIdAndUpdate(
          id,{
              address:req?.body?.address
             },
             {
              new:true
            }
          );
          res.json(user)
      } catch (error) {
        throw new Error(error)
      }
    });
    static userCart=asynchandler(async(req,res,)=>{
      const {cart}=req.body;
      const {_id}=req.user;
      validateMongodbId(_id);
      try {
        let products=[]
        const user=await User.findById(_id);
        //cheack if user already has product in cart
         const{alreadyExist}=Cart.findOne({orderBy:user._id});
         if(alreadyExist){
          alreadyExist.remove();
         };
         for(let i =0; i <cart.length;i++){
          let object={};
          object.product=cart[i]._id;
          object.count=cart[i].count;
          let getPrice=await Product.findById(cart[i]._id).select("price").exec();
          object.price=getPrice.price;
          products.push(object);
         
         }
         let cartTotal=0;
         for(let i =0; i <products.length;i++){
           cartTotal=cartTotal+products[i].price*products[i].count;
         }
        let newCart= await new Cart({
          products,
          cartTotal,
          orderBy:user?._id
        }).save();
        res.json(newCart);
      } catch (error) {
        throw new Error(error)
      }
    });
    static getUserCart=asynchandler(async(req,res)=>{
      const{_id}=req.user
      validateMongodbId(_id);
      try {
        const cart=await Cart.findOne({orderBy:_id}).populate("products.product");
        res.json(cart)
      } catch (error) {
        throw new Error(error)
      }
    })
    static emptyCart=asynchandler(async(req,res)=>{
      const{_id}=req.user
      validateMongodbId(_id);
      try {
        const user=await User.findOne({_id});
        const cart=await Cart.findOneAndDelete({orderBy:user._id});
          res.json(cart)
      } catch (error) {
        throw new Error(error)
      }
    })
    static applyCoupon=asynchandler(async(req,res)=>{
      const{_id}=req.user;
      const{coupon}=req.body;
      validateMongodbId(_id);
      try {
        const validCoupon=await Coupon.findOne({name:coupon});
       if(validCoupon== null){
        throw new Error("invalid coupon");
       }
       const user=await User.findOne({_id});
        let {cartTotal}=await Cart.findOne({orderBy:user._id}).populate("products.product");
        let totalAfterDiscount=(cartTotal-(cartTotal*validCoupon.discount)/100).toFixed(2);
        await Cart.findOneAndUpdate({orderBy:user._id},{totalAfterDiscount},{new:true})
          res.json(totalAfterDiscount);
      } catch (error) {
        throw new Error(error)
      }
    })
    static createOrder=asynchandler(async(req,res)=>{
      const{_id}=req.user;
      const{couponApplied,COD}=req.body;
      validateMongodbId(_id);
      try {
        if(!COD)throw new Error("create cash order failed");
        const user=await User.findById({_id});
    let userCart=await Cart.findOne({orderBy:user._id});
    let finalAmount=0;
    if(couponApplied&&userCart.totalAfterDiscount){
      finalAmount=userCart.totalAfterDiscount
    }else{
      finalAmount=userCart.cartTotal
    }
    let newOrder=await new Order({
      products:userCart.products,
      paymentIntent:{
        id:uniqid(),
        method:COD,
        amount:finalAmount,
        status:"Cash on Delivery",
        created:Date.now(),
        currency:"usd"
    },
    orderBy:user._id,
    orderStatus:"Cash on Delivery"
    }).save();
    let update=userCart.products.map((item)=>{
      return{
        updateOne:{
           filter:{_id:item.product._id},
           update:{$inc:{quantity:-item.count,sold:+item.count}}
        }
      }
    });
    const updated=await Product.bulkWrite(update,{});
          res.json({message:'success',success:true,newOrder,updated});
      } catch (error) {
        throw new Error(error)
      }
    })  
    static getOrder=asynchandler(async(req,res)=>{
      const{_id}=req.user
      validateMongodbId(_id);
      try {
        const userOrders=await Order.findOne({orderBy:_id}).populate('products.product');
   
          res.json(userOrders)
      } catch (error) {
        throw new Error(error)
      }
    })
    static updateOrderStatus=asynchandler(async(req,res)=>{
      const{_id}=req.user
      const{id}=req.params;
      const{status}=req.body;
     
      try {
        validateMongodbId(id);
        const updateOrder =await Order.findByIdAndUpdate(id,{orderStatus:status,paymentIntent:{status:status}},{new:true});
   
          res.json(updateOrder)
      } catch (error) {
        throw new Error(error)
      }
    })
}
module.exports=UserController;