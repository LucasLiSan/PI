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

router.post("/profileUser/update/:id", (req, res) => {
    const id = req.body.id
    const nome = req.body.nome
    const cpf = req.body.cpf
    const endereco = req.body.endereco
    Cliente.update(
        {
            nome : nome,
            cpf : cpf,
            endereco : endereco
        },
        {where: {id : id}}
    ).then(() => {
        res.redirect("/clientes")
    })
})

export default router;
