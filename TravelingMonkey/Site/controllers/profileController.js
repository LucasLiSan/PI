import express from "express";
import session from "express-session";
import Turistas from "../models/turistas.js";
import GuiasDeTurismo from "../models/guias.js";
import Cidades from "../models/cidades.js";
import PontosTuristicos from "../models/pontos.js";
import Atracoes from "../models/atracoes.js";
import Auth from "../middleware/auth.js";
const router = express.Router();

router.get("/profileUser", (req, res) => {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;
        res.render("profileUser", {
            session: req.session, // Passando a sessão para a view
            user: user,
            loggedOut: loggedOut,
            messages: req.flash()
        });
});

export default router;
