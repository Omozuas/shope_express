const Product=require("../models/product_model");
const asynchandler=require('express-async-handler');
const slugify=require('slugify');
const cloudinary=require("../config/cloudnary");
const fs=require('fs');
const User = require("../models/user_model");
class ProductController{
    static createProduct = asynchandler(async (req,res)=>{
      try{ 
        if(req.body.title){
            req.body.slug=slugify(req.body.title)
        }
        if(req.files.isEmpty) throw new Error('no image found');
        const uploader= async(path) => await cloudinary.uploads(path,"Images")
        const urls=[];
        const files=req.files
        for(const file of files){
        const{path}=file
        const newPath=await uploader(path)
        urls.push(newPath);
        fs.unlinkSync(path)}
          const newProduct= await Product.create({
            title:req.body.title,
            slug:req.body.slug,
            description:req.body.description,
            price:req.body.price,
            brand:req?.body?.brand,
            sold:req?.body?.sold,
            quantity:req?.body?.quantity,
            category:req?.body?.category,
            images:urls,
            color:req?.body?.color,
            ratings:req.body?.ratings
        })
          res.json({message:'succesfully added',success:true,newProduct})
        }
        catch(error){
            throw new Error(error);
        }
     });
    static getAProduct= asynchandler(async(req,res)=>{
        const {id}=req.params
        try {
            const findProduct=await Product.findById(id)
            res.json(findProduct);
        } catch (error) {
            throw new Error(error);
        }
    });
    static updateProducts = asynchandler(async(req,res)=>{
        const {id} = req.params;
        try {
        
            if(req.body.title){
                req.body.slug = slugify(req.body.title);
            }
            const updateProducts = await Product.findOneAndUpdate(
                { _id: id }, 
                req.body,
                { new: true }
            );
        
            res.json({updateProducts,message:"product updated",success:true})
        } catch (error) {
            throw new Error(error);
        }
    });
    static deleteProduct = asynchandler(async(req,res)=>{
        const { id }= req.params;
        try {
            const deleteProducts =await Product.findOneAndDelete({_id:id});
            res.json({deleteProducts,message:"product deleted",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static searchProduct = asynchandler(async(req,res)=>{
       
        try {

            //filtering
            const querObj={...req.query};
            const excludeFileds=["page","sort","limit","fields"];
            excludeFileds.forEach((el)=>delete querObj[el]);
            console.log(querObj)
            let querStr=JSON.stringify(querObj)
            querStr=querStr.replace(/\b(gte|gt|lt)\b/g, match =>`$${match}`);

            let query=Product.find (JSON.parse(querStr))

            //sorting

            if(req.query.sort){
                const sortBy=req.query.sort.split(',').join(' ')
               query=query.sort(sortBy)
            }else{
                query=query.sort('-createdAt')
            }
            ///limiting the fileds
            if(req.query.fields){
                const fileds=req.query.fields.split(',').join(' ');
                query=query.select(fileds)
            }else{
               query=query.select('-__v')
            }

            //pagnation
            const page = req.query.page;
            const limit= req.query.limit;
            const skip =(page -1)*limit;
            query=query.skip(skip).limit(limit);
            if(req.query.page){
                const productCount= await Product.countDocuments();
                if(skip >= productCount)throw new Error('this page does not exist');
            }
            console.log(page,limit,skip)
            const getallProducts =await query
            res.json(getallProducts);
        } catch (error) {
            throw new Error(error);
        }
    });
//     static imageProduct = asynchandler(async(req,res)=>{
       
//         try {
//    const uploader= async(path) => await cloudinary.uploads(path,"Images")
//    const urls=[];
//    const files=req.files
//    for(const file of files){
//     const{path}=file
//     const newPath=await uploader(path)
//     urls.push(newPath);
//     fs.unlinkSync(path)
//    }
//    res.json({message:'images uploaded',data:urls})
          
//         } catch (error) {
//             throw new Error(error);
//         }
//     });
static addToWishlist = asynchandler(async(req,res)=>{
    const {_id}= req.user;
    const {productId}= req.body;

    try {
        const user =await User.findById({_id});
        const alreadyadded=user.whislist.find((id)=>id.toString() === productId );
        if(alreadyadded){
         let user= await User.findByIdAndUpdate(_id,
            {
               $pull:{whislist: productId},
            },
            {
                new:true,
            }
        );
         res.json({user,message:"wishitem deleted",success:true});
        }else{
            let user= await User.findByIdAndUpdate(_id,
                {
                   $push:{whislist: productId}
                },
                {
                    new:true,
                }
            );
            res.json({user,message:"wishitem added",success:true});
        }
       
    } catch (error) {
        throw new Error(error);
    }
});
}

module.exports=ProductController;