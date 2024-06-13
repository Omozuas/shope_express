const express = require('express');
const mongoose =require('mongoose');
const bodyPerser=require('body-parser')
const dotenv = require('dotenv').config()
const cors =require('cors');
const dbConnect =require('./config/dbConnect');
const Router=require('./routes/index');
const productRouter=require('./routes/productRoutes');
const authRoter=require('./routes/authRoutes');
const categoryRoter=require('./routes/categoryRoutes');
const brandRoter=require('./routes/brandCategoryRoutes');
const blogCategoryRoter=require('./routes/blogcartegoryRoutes');
const cuponRoter=require('./routes/couponRoutes');
const cookieParser = require('cookie-parser')
const morgan=require('morgan');
const cron = require("node-cron");
const shell=require('shelljs')
dbConnect();



const app=express();



//router
app.use(cors());
app.use(morgan('dev'))
app.use(bodyPerser.json())
app.use(express.json())
app.use(express.urlencoded({extended:true}))
app.use(cookieParser())


app.use(Router);
app.use('/api/user',authRoter);
app.use('/api/product',productRouter);
app.use('/api/category',categoryRoter);
app.use('/api/brand',brandRoter);
app.use('/api/blog-category',blogCategoryRoter);
app.use('/api/cupon',cuponRoter);

//start server
app.listen(process.env.PORT ,()=>{
   cron.schedule("*/10 * * * * ",()=>{
    console.log('server is running on 4000')
    const currentTime = new Date();
    console.log(`Current time: ${currentTime}`);
    })
})

