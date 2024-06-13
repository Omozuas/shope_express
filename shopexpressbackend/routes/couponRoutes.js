const express = require('express');
const Route=express.Router();
const errorHandler=require('../middlewares/errorhandler')
const CuponController=require('../controller/couponController');
const authIsVendorOrIsAdmin=require("../middlewares/Auth");



Route.post('/create-cupon',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CuponController.createCupon);
Route.get('/get-all-cupon',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CuponController.getallCupon);
Route.put('/update-coupon/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CuponController.updateCupons);
Route.delete('/delete-coupon/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CuponController.deleteCupons);
// Route.delete('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CuponController.deletebrandCategory);
// Route.get('/',authIsVendorOrIsAdmin.authmiddleware,CuponController.getllbrandCategory);
// // Route.get('/home',IndexController.home);


Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);


module.exports=Route;