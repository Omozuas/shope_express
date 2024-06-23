const mongoose = require('mongoose'); // Erase if already required

// Declare the Schema of the Mongo model
var subCategorySchema = new mongoose.Schema({
    title:{
        type:String,
        required:true,
        unique:true,
        index:true,
    },
    category: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Category',
        required: true,
      },
 
},{
    timestamps:true
});

//Export the model
module.exports = mongoose.model('Subcategory', subCategorySchema);