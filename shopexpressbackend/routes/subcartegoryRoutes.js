const express = require('express');
const Route=express.Router();
const errorHandler=require('../middlewares/errorhandler')
const SubCategoryController=require('../controller/subCategoryController');
const authIsVendorOrIsAdmin=require("../middlewares/Auth");

Route.post('/create-subcategory',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,SubCategoryController.createSubCategory);
Route.get('/:id',authIsVendorOrIsAdmin.authmiddleware,SubCategoryController.getSubCategory);
Route.put('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,SubCategoryController.updateSubCategory);
Route.delete('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,SubCategoryController.deleteSubCategory);
Route.get('/',authIsVendorOrIsAdmin.authmiddleware,SubCategoryController.getllSubCategory);
// Route.get('/home',IndexController.home);


Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);


module.exports=Route;