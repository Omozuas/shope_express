const express = require('express');
const Route=express.Router();
const authRoter=require('../controller/userController')
const errorHandler=require('../middlewares/errorhandler')
const Auth=require('../middlewares/Auth');
const { upload } = require('../middlewares/multer');

Route.post('/signup',authRoter.createUser);
Route.post('/logIn',authRoter.loginUser);
Route.post('/forgot-password-token',authRoter.forgotPassword);
Route.post('/reset-password',authRoter.resetPassword);
Route.post('/add-to-cart',Auth.authmiddleware,authRoter.userCart);
Route.post('/cart/apply-coupon',Auth.authmiddleware,authRoter.applyCoupon);
Route.post('/cart/create-cash-order',Auth.authmiddleware,authRoter.createOrder);

Route.get('/getUser',authRoter.getUsers);
Route.get('/get-user-cart',Auth.authmiddleware,authRoter.getUserCart);
Route.get('/get-orders',Auth.authmiddleware,authRoter.getOrder);
Route.get('/logout',Auth.authmiddleware,authRoter.logout);
Route.get('/refreshToken',Auth.authmiddleware,authRoter.genRefreshToken);
Route.get('/get-user-byId',Auth.authmiddleware,authRoter.getaUserbyId);
Route.get('/get-wish-list',Auth.authmiddleware,authRoter.getWishList);

Route.put('/password',Auth.authmiddleware,authRoter.updateUserPasswordbyId);
Route.put('/save-address',Auth.authmiddleware,
    authRoter.saveAddress);
Route.delete('/empty-cart',Auth.authmiddleware,authRoter.emptyCart);
Route.delete('/:id',Auth.authmiddleware,authRoter.deleteaUserbyId);
Route.put('/edit-user',Auth.authmiddleware,upload.single('image'),authRoter.updateUserbyId);
Route.put('/block-user/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.blockUserbyId);
Route.put('/unblock-user/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.unblockUserbyId);
Route.put('/update-order-status/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.updateOrderStatus);



Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);
// Route.get('/home',IndexController.home);


module.exports=Route;