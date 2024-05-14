import express from "express";
const router = express.Router();

router.get('/cidades', function(req,res){
    res.render("cidades")
});

export default router;