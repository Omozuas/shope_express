const express = require('express');
const mongoose =require('mongoose');
const bodyPerser=require('body-parser')
const dotenv = require('dotenv').config()
const cors =require('cors');
const dbConnect =require('./config/dbConnect');
const Router=require('./routes/index');
const Homerouter=require('./routes/home');
const authRoter=require('./routes/authRoutes');
const cookieParser = require('cookie-parser')
dbConnect();



const app=express();



//router
app.use(cors());
app.use(bodyPerser.json())
app.use(express.json())
app.use(express.urlencoded({extended:true}))
app.use(cookieParser())

app.use(Router);
app.use(Homerouter);
app.use('/api/user',authRoter);

//start server
app.listen(process.env.PORT ,()=>{
    console.log('server is running on 4000')
})