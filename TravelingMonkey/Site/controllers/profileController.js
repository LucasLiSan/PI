import express from "express";
import session from "express-session";
import Turistas from "../models/turistas.js";
import GuiasDeTurismo from "../models/guias.js";
import Cidades from "../models/cidades.js";
import PontosTuristicos from "../models/pontos.js";
import Atracoes from "../models/atracoes.js";
import Auth from "../middleware/auth.js";
const router = express.Router();

router.get("/profileUser", Auth, (req,res) => {
    res.render("profileUser", {
        loggedOut: true,
        messages: req.flash()
    });
});

export default router;