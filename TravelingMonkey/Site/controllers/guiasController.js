import express from "express";
const router = express.Router();

router.get('/guias', function(req,res){
    res.render("guias")
});

export default router;