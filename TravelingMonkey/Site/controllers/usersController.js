import express from "express";
import bcrypt from "bcrypt";
import session from "express-session";
import Turistas from "../models/turistas.js";
const router = express.Router();

//ROTA LOGIN
router.get('/login', function(req,res){
    res.render("login", {
        loggedOut: true,
        messages: req.flash()
    });
});

//ROTA CADASTRO
router.get("/cadastro", (req,res) => {
    res.render("cadastro", {
        loggedOut: true,
        messages: req.flash()
    });
});

//ROTA AUTENTICAÇÃO
router.post("/auth", (req, res) => {
    const email = req.body.email;
    const senha = req.body.password;

    
})

export default router;