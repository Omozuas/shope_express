const Cupon=require('../models/cupon_modle');
const asynchandler=require('express-async-handler');
const { validateMongodbId } = require('../utils/validatemongodb');

class CuponController{
    static createCupon =asynchandler(async(req, res)=>{
        try {
            
            const newCupon= await Cupon.create(req.body);
            res.json({newCupon,message:'coupon created',success:true})

        } catch (error) {
            throw new Error(error)
        }
    });
    static getallCupon =asynchandler(async(req, res)=>{
        try {
            
            const cupons= await Cupon.find({});
            res.json({cupons,success:true})

        } catch (error) {
            throw new Error(error)
        }
    });

    static updateCupons =asynchandler(async(req, res)=>{
        const { id }=req.params;
        try {
            validateMongodbId(id)
            const updateCupons= await Cupon.findByIdAndUpdate(id,req.body,{new:true});

            res.json({updateCupons,success:true,message:'coupon updated'})

        } catch (error) {
            throw new Error(error)
        }
    });
    static deleteCupons =asynchandler(async(req, res)=>{
        const { id }=req.params;
        try {
            validateMongodbId(id)
            const deleteCupons= await Cupon.findByIdAndDelete(id);

            res.json({deleteCupons,success:true,message:'coupon deleted'})

        } catch (error) {
            throw new Error(error)
        }
    });
}

module.exports=CuponController