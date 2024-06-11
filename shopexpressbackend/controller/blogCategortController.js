const blogcategory=require('../models/blogCategory');
const asynchandler=require('express-async-handler');
const { validateMongodbId } = require('../utils/validatemongodb');

class BlogCategoryController{
    
    static createblogCategory = asynchandler(async(req,res)=>{
        const { id } = req.user;
        
        try {
            validateMongodbId(id);
            const newblogCategory =await blogcategory.create(req.body);
            res.json({newblogCategory,message:"created success",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static updateblogCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
      
           try {
            validateMongodbId(id);
            const updateblogCategory =await blogcategory.findOneAndUpdate(
                { _id: id }, 
                req.body,
                { new: true }
            );
            res.json({updateblogCategory,message:"cartegory updated",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static deleteblogCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        validateMongodbId(id);
           try {
           
            const updateblogCategory =await blogcategory.findByIdAndDelete(id);
            res.json({updateblogCategory,message:"blogcartegory deleted",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getblogCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        
        validateMongodbId(id);
           try {
            const getblogCategory =await blogcategory.findById(id);
            res.json({getblogCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getllblogCategory = asynchandler(async(req,res)=>{
        
           try {
            const getAllblogCategory =await blogcategory.find({});
            res.json({getAllblogCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
}
module.exports=BlogCategoryController;