const express = require('express');
const mongoose =require('mongoose');
const bodyPerser=require('body-parser')
const dotenv = require('dotenv').config()
const cors =require('cors');

const app=express();



//router
app.use(bodyPerser.json())
app.use(express.json())
app.use(express.urlencoded({extended:true}))


//start server
app.listen(5000 ,()=>{
    console.log('server is running on 5000')
})