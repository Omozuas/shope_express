const express = require('express');
const Route=express.Router();
const errorHandler=require('../middlewares/errorhandler')
const BlogCategoryController=require('../controller/blogCategortController');
const authIsVendorOrIsAdmin=require("../middlewares/Auth");

Route.post('/create-blogcategory',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,BlogCategoryController.createblogCategory);
Route.get('/:id',authIsVendorOrIsAdmin.authmiddleware,BlogCategoryController.getblogCategory);
Route.put('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,BlogCategoryController.updateblogCategory);
Route.delete('/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsAdmin,BlogCategoryController.deleteblogCategory);
Route.get('/',authIsVendorOrIsAdmin.authmiddleware,BlogCategoryController.getllblogCategory);
// Route.get('/home',IndexController.home);


Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);


module.exports=Route;