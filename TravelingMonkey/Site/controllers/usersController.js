import express from "express";
import bcrypt from "bcrypt";
import session from "express-session";
import Turistas from "../models/turistas.js";
import GuiasDeTurismo from "../models/guias.js";
import Cidades from "../models/cidades.js";
const router = express.Router();

function formatDate(date) {
    const d = new Date(date);
    const year = d.getFullYear();
    const month = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

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

// ROTA DE CRIAÇÃO DE USUÁRIO NO BANCO
router.post("/createUser", (req, res) => {
    const profile = req.body.profile;
    console.log("Profile:", profile);

    if (profile === 'cidade') {
        const {
            nomeCidade, ufCidade, cnpjCidade, orgRespCidade, cnpjOrgRespCidade,
            endRuaOrgRespCidade, endNumOrgRespCidade, endBairroOrgRespCidade, endCepOrgRespCidade,
            telOrgRespCidade, emailOrgRespCidade, passwordCidade
        } = req.body;
        console.log("Cidade:", emailOrgRespCidade);

        Cidades.findOne({ where: { emailOrgRespCidade: emailOrgRespCidade } }).then(cidades => {
            console.log("Cidade encontrada:", cidades);
            if (cidades === null) {
                const saltCidade = bcrypt.genSaltSync(10);
                const hashCidade = bcrypt.hashSync(passwordCidade, saltCidade);
                Cidades.create({
                    nomeCidade, ufCidade, cnpjCidade, orgRespCidade, cnpjOrgRespCidade,
                    endRuaOrgRespCidade, endNumOrgRespCidade, endBairroOrgRespCidade, endCepOrgRespCidade,
                    telOrgRespCidade, emailOrgRespCidade, passwordCidade: hashCidade
                }).then(() => {
                    req.flash('success', 'Usuário cadastrado.');
                    res.redirect("/login");
                });
            } else {
                req.flash('danger', 'Usuário já cadastrado.');
                res.redirect("/login");
            }
        }).catch(error => {
            console.error("Erro ao buscar cidade:", error);
            res.status(500).send("Erro no servidor");
        });

    } else if (profile === 'guia') {
        const {
            nomeGuia, cadGuia, motorGuia, idiomaGuia, emailGuia, passwordGuia
        } = req.body;
        console.log("Guia:", emailGuia);

        GuiasDeTurismo.findOne({ where: { emailGuia: emailGuia } }).then(guias => {
            console.log("Guia encontrado:", guias);
            if (guias === null) {
                const saltGuia = bcrypt.genSaltSync(10);
                const hashGuia = bcrypt.hashSync(passwordGuia, saltGuia);
                GuiasDeTurismo.create({
                    nomeGuia, cadGuia, motorGuia, idiomaGuia, emailGuia, passwordGuia: hashGuia
                }).then(() => {
                    req.flash('success', 'Usuário cadastrado.');
                    res.redirect("/login");
                });
            } else {
                req.flash('danger', 'Usuário já cadastrado.');
                res.redirect("/login");
            }
        }).catch(error => {
            console.error("Erro ao buscar guia:", error);
            res.status(500).send("Erro no servidor");
        });

    } else if (profile === 'turista') {
        const {
            nomeTurista, cpfTurista, nascTurista, endRuaTurista, endBairroTurista,
            endNumTurista, endCepTurista, idiomaTurista, telTurista, emailTurista, passwordTurista
        } = req.body;
        const formattedNascTurista = formatDate(nascTurista);
        console.log("Turista:", emailTurista);

        Turistas.findOne({ where: { emailTurista: emailTurista } }).then(user => {
            console.log("Turista encontrado:", user);
            if (user === null) {
                const saltTurista = bcrypt.genSaltSync(10);
                const hashTurista = bcrypt.hashSync(passwordTurista, saltTurista);
                Turistas.create({
                    nomeTurista, cpfTurista, nascTurista: formattedNascTurista, endRuaTurista,
                    endBairroTurista, endNumTurista, endCepTurista, idiomaTurista, telTurista,
                    emailTurista, passwordTurista: hashTurista
                }).then(() => {
                    req.flash('success', 'Usuário cadastrado.');
                    res.redirect("/login");
                });
            } else {
                req.flash('danger', 'Usuário já cadastrado.');
                res.redirect("/login");
            }
        }).catch(error => {
            console.error("Erro ao buscar turista:", error);
            res.status(500).send("Erro no servidor");
        });

    } else {
        res.status(400).send('Tipo de cadastro inválido');
    }
});

//ROTA AUTENTICAÇÃO

const profileModels = {
    'Cidade': {
        model: Cidades,
        emailField: 'emailOrgRespCidade',
        passwordField: 'passwordCidade',
        sessionKey: 'cidade',
        sessionNameField: 'nomeCidade',
        sessionFields: ['id', 'emailOrgRespCidade', 'nomeCidade']
    },
    'Guia': {
        model: GuiasDeTurismo,
        emailField: 'emailGuia',
        passwordField: 'passwordGuia',
        sessionKey: 'guia',
        sessionNameField: 'nomeGuia',
        sessionFields: ['id', 'emailGuia', 'nomeGuia']
    },
    'Turista': {
        model: Turistas,
        emailField: 'emailTurista',
        passwordField: 'passwordTurista',
        sessionKey: 'turista',
        sessionNameField: 'nomeTurista',
        sessionFields: ['id', 'emailTurista', 'nomeTurista']
    }
};

router.post("/auth", (req, res) => {
    const profile = req.body.user;
    const email = req.body.email;
    const password = req.body.password;

    // Obter o mapeamento correto com base no perfil
    const profileData = profileModels[profile];

    if (!profileData) {
        req.flash('danger', 'Perfil inválido!');
        return res.redirect("/login");
    }

    const Model = profileData.model;
    const emailField = profileData.emailField;
    const passwordField = profileData.passwordField;
    const sessionKey = profileData.sessionKey;
    const sessionNameField = profileData.sessionNameField;
    const sessionFields = profileData.sessionFields;

    // BUSCA O USUÁRIO NO BANCO
    Model.findOne({ where: { [emailField]: email } }).then(user => {
        // SE O USUÁRIO EXISTIR
        if (user != undefined) {
            // VALIDA A SENHA
            const correct = bcrypt.compareSync(password, user[passwordField]);
            // SE A SENHA FOR VÁLIDA
            if (correct) {
                // AUTORIZA O LOGIN - CRIAREMOS A SESSAO DO USUARIO
                req.session[sessionKey] = {};
                sessionFields.forEach(field => {
                    req.session[sessionKey][field] = user[field];
                });

                req.flash('success', `Login efetuado com sucesso! Bem-vindo ${user[sessionNameField]}`);
                res.redirect("/home");
            } else {
                // SE A SENHA NÃO FOR VÁLIDA
                req.flash('danger', 'Senha incorreta! Tente novamente.');
                res.redirect("/login");
            }
        } else {
            // SE O USUÁRIO NÃO EXISTIR
            req.flash('danger', 'Usuário não cadastrado!');
            res.redirect("/login");
        }
    }).catch(err => {
        console.error(err);
        req.flash('danger', 'Ocorreu um erro. Tente novamente.');
        res.redirect("/login");
    });
});

export default router;