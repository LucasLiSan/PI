//CONTROLLER PARA AS RESERVAS

import express from "express";
import session from "express-session";
import bcrypt from "bcrypt";
import PontosTuristicos from "../models/pontos.js";
const router = express.Router();

router.get('/home', function(req, res) {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
    PontosTuristicos.findAll().then(pontos => {
        res.render("index", {
            pontos: pontos, // Correctly passing the variable 'pontos'
            loggedOut: loggedOut
        });
    });
});

router.get('/reserva', function(req, res) {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
    res.render("reserva", {
        loggedOut: loggedOut,
    });
});

export default router;