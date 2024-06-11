const express = require('express');
const Route=express.Router();
const errorHandler=require('../middlewares/errorhandler')
const BrandCategoryController=require('../controller/brandcategoryController');
const authIsVendorOrIsAdmin=require("../middlewares/Auth");

Route.post('/create-brandcategory',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,BrandCategoryController.createbrandCategory);
Route.get('/:id',authIsVendorOrIsAdmin.authmiddleware,BrandCategoryController.getbrandCategory);
Route.put('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,BrandCategoryController.updatebrandCategory);
Route.delete('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,BrandCategoryController.deletebrandCategory);
Route.get('/',authIsVendorOrIsAdmin.authmiddleware,BrandCategoryController.getllbrandCategory);
// Route.get('/home',IndexController.home);


Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);


module.exports=Route;