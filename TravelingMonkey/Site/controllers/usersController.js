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
    
    // COLETANDO INFORMAÇÕES DO CORPO DA REQUISIÇÃO

    const email = req.body.email;
    const password = req.body.password;
    const nome = req.body.nomeCidade;
    //const nomeCidade = req.body.nomeCidade;
    //const cnpj = req.body.cnpj;
    //const formattedDate = formatDate(dataNascimento);

    // VERIFICA SE O USUÁRIO JÁ ESTÁ CADASTRADO NO BANCO
    Cidades.findOne({where: {email : email}}).then(cidades => {
        // SE NÃO HOUVER
        if(cidades == undefined){
            // AQUI SERÁ FEITO O CADASTRO
            const salt = bcrypt.genSaltSync(10)
            const hash = bcrypt.hashSync(password, salt)
            Cidades.create({
                nome : nome,
                //cnpjCidade : cnpj,
                email : email,
                password : hash,
            }).then(() => {
                res.redirect("/login")
            })

            // CASO JÁ EXISTA UM USUÁRIO CADASTRADO COM O MESMO E-MAIL
        } else {
            req.flash('danger', 'Usuario já cadastrado.')
            res.redirect("/login")
        }
    })
})

//ROTA AUTENTICAÇÃO

const profileModels = {
    'Cidade': Cidades,
    'Guia': GuiasDeTurismo,
    'Turista': Turistas
};

router.post("/auth", (req, res) => {
    const profile = req.body.user;
    const email = req.body.email;
    const password = req.body.password;

    // Obter o modelo correto com base no perfil
    const Model = profileModels[profile];

    if (!Model) {
        req.flash('danger', 'Perfil inválido!');
        return res.redirect("/login");
    }

    // BUSCA O USUÁRIO NO BANCO
    Model.findOne({where: {email : email}}).then(user => {
        // SE O USUÁRIO EXISTIR
        if (user != undefined) {
            // VALIDA A SENHA
            const correct = bcrypt.compareSync(password, user.password);
            // SE A SENHA FOR VÁLIDA
            if (correct) {
                // AUTORIZA O LOGIN - CRIAREMOS A SESSAO DO USUARIO
                req.session.user = {
                    id: user.id,
                    email: user.email,
                    nome: user.nome
                };
                req.flash('success', `Login efetuado com sucesso! Bem-vindo ${req.session.user['nome']}`);
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