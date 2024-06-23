const mongoose = require('mongoose'); // Erase if already required
const crypto=require('crypto');
// Declare the Schema of the Mongo model
var userSchema = new mongoose.Schema({
   firstname:{
        type:String,
        required:true,
    },
    lastname:{
        type:String,
        required:true,
    },
    email:{
        type:String,
        required:true,
        unique:true,
    },
    mobile:{
        type:String,
        required:true,
        unique:true,
    },
    password:{
        type:String,
        required:true,
    },
    role:{
        type:String,
        default:'user'
    },
    isBlocked:{
        type:Boolean,
        default: false
    },
    isLogin:{
        type:Boolean,
        default: false
    },
    cart:{
        type:Array,
        default:[]
    },
    address:{
        type:String,
    },
    whislist:[{
        type:mongoose.Schema.Types.ObjectId,
        ref:"Product"
    }],
    refreshToken:{
        type:String,
    },
    profileImg:String,
    passwordChanged:Date,
    passwordResetExpires:Date,
    passwordResetToken:String
},{timestamps:true});
userSchema.pre("save",async function(next){
    if(!this.isModified('password')){
        next();
    }
})
userSchema.methods.createPasswordResetToken= async function(){
    const resetToken= crypto.randomBytes(32).toString("hex");
    this.passwordResetToken =crypto.createHash("sha256").update(resetToken).digest("hex");
    this.passwordResetExpires=Date.now()+30*60*1000//10 mins
    return resetToken;
}
//Export the model
module.exports = mongoose.model('User', userSchema);