//CONTROLLER PARA AS RESERVAS

import express from "express";
import session from "express-session";
import bcrypt from "bcrypt";
import { Sequelize, Op, QueryTypes } from 'sequelize';
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
        const pontosComMedia = await PontosTuristicos.findAll({
            attributes: ['id', 'nomePonto', 'profilePicPonto', [Sequelize.fn('AVG', Sequelize.col('avaliacoesRelacionadas.avaliacaoDetalhe.nota')), 'media']],
            include: [{
                model: PontosAvaliacoes,
                as: 'avaliacoesRelacionadas',
                attributes: [],
                include: [{
                    model: AvaliacoesPontos,
                    as: 'avaliacaoDetalhe',
                    attributes: [],
                    required: true
                }],
                required: true
            }],
            group: ['pontos.id']
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