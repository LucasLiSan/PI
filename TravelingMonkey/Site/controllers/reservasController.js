//CONTROLLER PARA AS RESERVAS

import express from "express";
import session from "express-session";
import bcrypt from "bcrypt";
import PontosTuristicos from "../models/pontos.js";
import AvaliacoesPontos from "../models/feedbackPonto.js";
import PontosAvaliacoes from "../models/pontoAvaliado.js";
import AvaliacoesGuias from "../models/feedbackGuia.js";
import GuiasAvaliacoes from "../models/guiaAvaliado.js";
import "../models/associations.js";

const router = express.Router();

router.get('/home', async function(req, res) {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
    try {
        const pontos = await PontosTuristicos.findAll({
            include: [{
                model: PontosAvaliacoes,
                include: [AvaliacoesPontos],
            }]
        });

        const pontosComMedia = pontos.map(ponto => {
            const avaliacoes = ponto.avaliacaoPontos || []; // Verifica se avaliacoesPontos está definido, caso contrário, define como um array vazio
            const notas = avaliacoes.map(avaliacao => avaliacao.nota); // Se avaliacoesPontos estiver definido, mapeia as notas, caso contrário, retorna um array vazio
            console.log("Notas do ponto:", notas);
            console.log("Avaliacao do ponto:", avaliacoes);
            const media = notas.length ? (notas.reduce((a, b) => a + b, 0) / notas.length) : 0;
            return {
                ...ponto.dataValues,
                media: Math.round(media)
            };
        });

        res.render("index", {
            pontos: pontosComMedia,
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