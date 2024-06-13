const mongoose = require('mongoose'); // Erase if already required

// Declare the Schema of the Mongo model
var productSchema = new mongoose.Schema({
    title:{
        type:String,
        required:true,
        trim:true
    },
    slug:{
        type:String,
        required:true,
        unique:true,
        lowercase:true
    },
    description:{
        type:String,
        required:true,
    },
    brand:{
        type:String,
    },
    price:{
        type:Number,
        required:true,
    },
    sold:{
        type:Number,
        default:0
    },
    quantity:{
        type:Number,
    },
    category:{
        type:String,
        require:true
       
    },
    images:{
        type:Array,
    },
    color:{
        type:String,
    },
    totalrating:{
        type:String,
        default:0
    },
    ratings:[{
        star:Number,
        comment:String,
        postedBy:{type:mongoose.Schema.Types.ObjectId,  ref:'User',},
      
    }],
},{timestamps:true});

//Export the model
module.exports = mongoose.model('Product', productSchema);