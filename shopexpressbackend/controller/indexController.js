class IndexController{
    static index(req,res){
        res.send('hello from index controller')
    }
    static home(req,res){
        res.send('hello from home index controller')
    }
}

module.exports=IndexController;