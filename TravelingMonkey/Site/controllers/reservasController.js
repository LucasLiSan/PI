//CONTROLLER PARA AS RESERVAS

import express from "express";
import session from "express-session";
import bcrypt from "bcrypt";
import { Sequelize, Op, QueryTypes } from 'sequelize';
import Auth from '../middleware/auth.js';
/* ---------- TABLES ---------- */
import PontosTuristicos from "../models/pontos.js";
import AvaliacoesPontos from "../models/feedbackPonto.js";
import PontosAvaliacoes from "../models/pontoAvaliado.js";
import AvaliacoesGuias from "../models/feedbackGuia.js";
import GuiasAvaliacoes from "../models/guiaAvaliado.js";
import CategoriasPontos from "../models/categoriaXponto.js";
import "../models/associations.js";
/* ---------- TABLES ---------- */
const router = express.Router();

router.get('/home', async function(req, res) {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
    try {
        const pontosComMedia = await PontosTuristicos.findAll({
            attributes: ['id', 'nomePonto', 'modalidade', 'profilePicPonto', [Sequelize.fn('AVG', Sequelize.col('avaliacoesRelacionadas.avaliacaoDetalhe.nota')), 'media']],
            include: [
                {
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
                },
                {
                    model: CategoriasPontos,
                    as: 'categoria',
                    attributes: ['categoria']
                }
            ],
            group: ['pontos.id', 'categoria.id', 'categoria.categoria']
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

router.get('/reserva/:id', Auth, async function(req, res) {
    try {
        const pontoId = req.params.id;
        const ponto = await PontosTuristicos.findOne({ where: { id: pontoId } });

        if (!ponto) {
            return res.status(404).send('Ponto turístico não encontrado');
        }

        const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
        const loggedOut = !user;
        console.log("Rota /reserva/:id acessada. Usuário:", user ? "Logado" : "Deslogado");

        res.render("reserva", {
            loggedOut: loggedOut,
            ponto: ponto, // Passa o ponto para a view
            session: req.session,
            redirectTo: `/reserva/${pontoId}`
        });
    } catch (error) {
        console.error("Erro ao buscar ponto turístico:", error);
        res.status(500).send('Erro interno do servidor');
    }
});

export default router;