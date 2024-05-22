import express from "express";
const router = express.Router();

//TELA LOGIN
router.get('/login', function(req,res){
    res.render("login")
});

export default router;