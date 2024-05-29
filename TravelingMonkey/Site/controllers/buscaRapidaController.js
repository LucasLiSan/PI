import express from "express";
import PontosTuristicos from "../models/pontos.js";
import Cidades from "../models/cidades.js";
import Guias from "../models/guias.js";
import Auth from "../middleware/auth.js";

const router = express.Router();

//ROTA BUSCA RAPIDA CIDADES
router.get('/cidades', function(req, res) {
    PontosTuristicos.findAll().then(pontos => {
        res.render("cidades", {
            pontos: pontos
        });
    });
});

//ROTA BUSCA RAPIDA PONTOS
router.get('/pontos', Auth, function(req, res) {
    PontosTuristicos.findAll().then(pontos => {
        res.render("pontos", {
            pontos: pontos
        });
    });
});

//ROTA BUSCA RAPIDA GUIAS
router.get('/guias', Auth, function(req, res) {
    PontosTuristicos.findAll().then(pontos => {
        res.render("guias", {
            pontos: pontos
        });
    });
});

export default router;