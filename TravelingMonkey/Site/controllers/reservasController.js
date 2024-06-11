//CONTROLLER PARA AS RESERVAS

import express from "express";
import session from "express-session";
import bcrypt from "bcrypt";
import PontosTuristicos from "../models/pontos.js";
import Avaliados from "../models/avaliacaoXavaliado.js";
import Feedback from "../models/comentarios.js";
import "../models/associations.js";

const router = express.Router();

router.get('/home', async function(req, res) {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
    try {
        const pontos = await PontosTuristicos.findAll({
            include: [{
                model: Avaliados,
                include: [Feedback]
            }]
        });

        const pontosComNota = pontos.map(ponto => {
            const notas = ponto.avaliacaoXavaliados.map(avaliacao => avaliacao.comentAvalia.nota);
            const media = notas.length ? (notas.reduce((a, b) => a + b, 0) / notas.length) : 0;
            return {
                ...ponto.dataValues,
                media: Math.round(media)
            };
        });
        res.render("index", {
            pontos: pontosComNota,
            loggedOut: loggedOut
        });
    } catch (error) {
        console.error(error);
        res.status(500).send("Internal error");
    }
});

router.get('/reserva', function(req, res) {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
    res.render("reserva", {
        loggedOut: loggedOut,
    });
});

export default router;