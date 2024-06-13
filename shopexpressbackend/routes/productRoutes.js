const express = require('express');
const Route=express.Router();
const errorHandler=require('../middlewares/errorhandler')
const productController=require('../controller/productController');
const authIsVendorOrIsAdmin=require("../middlewares/Auth");
const { upload } = require('../middlewares/multer');

//this is  we binding middleware all the rotes in this file defined
Route.post('/add-new-product',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsVendor,upload.array('image'),productController.createProduct);
Route.put('/wishlist',authIsVendorOrIsAdmin.authmiddleware,productController.addToWishlist);
Route.put('/rating',authIsVendorOrIsAdmin.authmiddleware,productController.rating);
Route.get('/get-a-product/:id',authIsVendorOrIsAdmin.authmiddleware,productController.getAProduct);
Route.put('/update-a-product/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsVendor,productController.updateProducts);
Route.delete('/delete-a-product/:id',authIsVendorOrIsAdmin.authmiddleware,authIsVendorOrIsAdmin.authIsVendor, productController.deleteProduct);





Route.get('/search-for-product',productController.searchProduct);
// Route.post('/upload-image',upload.array('image'),productController.imageProduct);




Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);

module.exports=Route;