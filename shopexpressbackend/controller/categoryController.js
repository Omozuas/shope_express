const category=require('../models/category_model');
const asynchandler=require('express-async-handler');
const { validateMongodbId } = require('../utils/validatemongodb');

class CategoryController{
    
    static createCategory = asynchandler(async(req,res)=>{
        const { id } = req.user;
        
        try {
            validateMongodbId(id);
            const newCategory =await category.create(req.body);
            res.json({newCategory,message:"created success",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static updateCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
      
           try {
            validateMongodbId(id);
            const updateCategory =await category.findOneAndUpdate(
                { _id: id }, 
                req.body,
                { new: true }
            );
            res.json({updateCategory,message:"cartegory updated",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static deleteCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        validateMongodbId(id);
           try {
           
            const updateCategory =await category.findByIdAndDelete(id);
            res.json({updateCategory,message:"cartegory deleted",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        
        validateMongodbId(id);
           try {
            const getCategory =await category.findById(id);
            res.json({getCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getllCategory = asynchandler(async(req,res)=>{
        
           try {
            const getAllCategory =await category.find({});
            res.json({getAllCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
}
module.exports=CategoryController;