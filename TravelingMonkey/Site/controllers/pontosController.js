import express from "express";
const router = express.Router();

router.get('/pontos', function(req,res){
    res.render("pontos")
});

export default router;