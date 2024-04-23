import express from "express";
const router = express.Router();

router.get('/pedidos', function(req,res){
    res.render("pedidos")
});

export default router;