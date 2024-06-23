const Subcategory=require('../models/subCategory_model');
const asynchandler=require('express-async-handler');
const { validateMongodbId } = require('../utils/validatemongodb');

class SubCategoryController{
    
    static createSubCategory = asynchandler(async(req,res)=>{
        const { id } = req.user;
        
        try {
            validateMongodbId(id);
            const newSubCategory =await Subcategory.create(req.body);
            res.json({newSubCategory,message:"created success",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static updateSubCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
      
           try {
            validateMongodbId(id);
            const updateSubCategory =await Subcategory.findOneAndUpdate(
                { _id: id }, 
                req.body,
                { new: true }
            );
            res.json({updateSubCategory,message:"Subcartegory updated",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static deleteSubCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        validateMongodbId(id);
           try {
           
            const updateSubCategory =await Subcategory.findByIdAndDelete(id);
            res.json({updateSubCategory,message:"Subcartegory deleted",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getSubCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        
        validateMongodbId(id);
           try {
            const getSubCategory =await Subcategory.findById(id).populate('category');
            res.json({getSubCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getllSubCategory = asynchandler(async(req,res)=>{
        
           try {
            const getAllSubCategory =await Subcategory.find({}).populate('category');
            res.json({getAllSubCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
}
module.exports=SubCategoryController;