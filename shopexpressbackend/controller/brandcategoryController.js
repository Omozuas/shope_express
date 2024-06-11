const brandcategory=require('../models/brandCategory_model');
const asynchandler=require('express-async-handler');
const { validateMongodbId } = require('../utils/validatemongodb');

class BrandCategoryController{
    
    static createbrandCategory = asynchandler(async(req,res)=>{
        const { id } = req.user;
        
        try {
            validateMongodbId(id);
            const newbrandCategory =await brandcategory.create(req.body);
            res.json({newbrandCategory,message:"created success",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static updatebrandCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
      
           try {
            validateMongodbId(id);
            const updatebrandCategory =await brandcategory.findOneAndUpdate(
                { _id: id }, 
                req.body,
                { new: true }
            );
            res.json({updatebrandCategory,message:"cartegory updated",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static deletebrandCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        validateMongodbId(id);
           try {
           
            const updatebrandCategory =await brandcategory.findByIdAndDelete(id);
            res.json({updatebrandCategory,message:"cartegory deleted",success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getbrandCategory = asynchandler(async(req,res)=>{
        const {id} =req.params;
        
        validateMongodbId(id);
           try {
            const getbrandCategory =await brandcategory.findById(id);
            res.json({getbrandCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
    static getllbrandCategory = asynchandler(async(req,res)=>{
        
           try {
            const getAllbrandCategory =await brandcategory.find({});
            res.json({getAllbrandCategory,success:true});
        } catch (error) {
            throw new Error(error);
        }
    });
}
module.exports=BrandCategoryController;