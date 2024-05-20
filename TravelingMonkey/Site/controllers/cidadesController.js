import express from "express";
import Cidades from "../models/cidades.js";
const router = express.Router();

router.get('/cidades', function(req,res){
    Cidades.findAll().then(cidades => {
        res.render("cidades", {
            cidades : cidades
        })
    })
});

export default router;