const express = require('express');
const Route=express.Router();
const errorHandler=require('../middlewares/errorhandler')
const CategoryController=require('../controller/categoryController');
const authIsVendorOrIsAdmin=require("../middlewares/Auth");

Route.post('/create-category',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CategoryController.createCategory);
Route.get('/:id',authIsVendorOrIsAdmin.authmiddleware,CategoryController.getCategory);
Route.put('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CategoryController.updateCategory);
Route.delete('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,CategoryController.deleteCategory);
Route.get('/',authIsVendorOrIsAdmin.authmiddleware,CategoryController.getllCategory);
// Route.get('/home',IndexController.home);


Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);


module.exports=Route;