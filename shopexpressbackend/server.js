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
const cookieParser = require('cookie-parser')
const morgan=require('morgan');
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

//start server
app.listen(process.env.PORT ,()=>{
    console.log('server is running on 4000')
})