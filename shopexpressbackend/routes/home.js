const express = require('express');
const Route=express.Router();
const IndexController=require('../controller/indexController');


//this is  we binding middleware all the rotes in this file defined
Route.get('/home',IndexController.home);


module.exports=Route;