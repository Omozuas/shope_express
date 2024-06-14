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
const axios=require('axios');
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

cron.schedule("*/3 * * * * ", async () => {
    try {
      const currentTime = new Date();
      console.log(`Current time: ${currentTime}`);
      
      const response = await axios.get('https://shope-express.onrender.com/');
      console.log('API Response:', response.data);
    } catch (error) {
      console.error('Error fetching API:', error);
    }
  });


//start server
app.listen(process.env.PORT ,()=>{
    console.log('server is running on 4000')
})

