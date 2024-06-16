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

Route.get('/getUser',authRoter.getUsers);
Route.get('/logout',Auth.authmiddleware,authRoter.logout);
Route.get('/refreshToken',Auth.authmiddleware,authRoter.genRefreshToken);
Route.get('/:id',Auth.authmiddleware
,authRoter.getaUserbyId);
Route.put('/password',Auth.authmiddleware
,authRoter.updateUserPasswordbyId);
Route.delete('/:id',Auth.authmiddleware,authRoter.deleteaUserbyId);
Route.put('/edit-user',Auth.authmiddleware,upload.single('image'),authRoter.updateUserbyId);
Route.put('/block-user/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.blockUserbyId);
Route.put('/unblock-user/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.unblockUserbyId);



Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);
// Route.get('/home',IndexController.home);


module.exports=Route;