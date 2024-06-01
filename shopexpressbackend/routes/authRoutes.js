const express = require('express');
const Route=express.Router();
const authRoter=require('../controller/userController')
const errorHandler=require('../middlewares/errorhandler')
const Auth=require('../middlewares/Auth');

Route.post('/signup',authRoter.createUser);
Route.post('/logIn',authRoter.loginUser);
Route.get('/getUser',authRoter.getUsers);
Route.post('/refreshToken',authRoter.genRefreshToken);
Route.post('/logout',authRoter.logout);
Route.get('/:id',Auth.authmiddleware
,authRoter.getaUserbyId);
Route.delete('/:id',Auth.authmiddleware,authRoter.deleteaUserbyId);
Route.put('/:id',Auth.authmiddleware,authRoter.updateUserbyId);
Route.put('/block-user/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.blockUserbyId);
Route.put('/unblock-user/:id',Auth.authmiddleware,Auth.authIsAdmin,authRoter.unblockUserbyId);



Route.use(errorHandler.notfound);
Route.use(errorHandler.errorHandler);
// Route.get('/home',IndexController.home);


module.exports=Route;