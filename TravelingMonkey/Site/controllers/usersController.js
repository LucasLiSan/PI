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
router.post("/auth", (req, res) => {
    const profile = req.body.user;
    const LoginEmail = req.body.email;
    const LoginPassword = req.body.password;

    //BUSCA NO BANCO ESPECIFICO
    if (profile ==="Cidade"){
        Cidades.findOne({where: {emailOrgRespCidade : LoginEmail}}).then(userCidade => {
            // SE O USUÁRIO EXISTIR
            if (userCidade != undefined) { 
              // VALIDA A SENHA
              const correct = bcrypt.compareSync(LoginPassword, userCidade.passwordCidade);
              // SE A SENHA FOR VÁLIDA
              if(correct){
                // AUTORIZA O LOGIN - CRIAREMOS A SESSAO DO USUARIO
                req.session.userCidade = {
                  id : userCidade.id,
                  email : userCidade.emailOrgRespCidade,
                  nome : userCidade.nomeCidade,
                }
                req.flash('success', `Login efetuado com suceeso! Bem-Vindo ${req.session.userCidade['nome']}`);
                res.redirect("/profileUser");
              // SE A SENHA NÃO FOR VÁLIDA
              } else {
                // EXIBE A MENSAGEM
                req.flash('danger', 'Senha incorreta! Tente novamente.');
                res.redirect("/login");
              }
            }
        });
    } else if (profile === "Guia") {
        GuiasDeTurismo.findOne({where: {emailGuia : LoginEmail}}).then(userGuia => {
            // SE O USUÁRIO EXISTIR
            if (userGuia != undefined) { 
              // VALIDA A SENHA
              const correct = bcrypt.compareSync(LoginPassword, userGuia.passwordGuia);
              // SE A SENHA FOR VÁLIDA
              if(correct){
                // AUTORIZA O LOGIN - CRIAREMOS A SESSAO DO USUARIO
                req.session.userGuia = {
                  id : userGuia.id,
                  email : userGuia.emailGuia,
                  nome : userGuia.nomeGuia,
                }
                req.flash('success', `Login efetuado com suceeso! Bem-Vindo ${req.session.userGuia['nome']}`);
                res.redirect("/profileUser");
              // SE A SENHA NÃO FOR VÁLIDA
              } else {
                // EXIBE A MENSAGEM
                req.flash('danger', 'Senha incorreta! Tente novamente.');
                res.redirect("/login");
              }
            }
        });
    } else if (profile === "Turista") {
        Turistas.findOne({where: {emailTurista : LoginEmail}}).then(userTurista => {
            // SE O USUÁRIO EXISTIR
            if (userTurista != undefined) { 
              // VALIDA A SENHA
              const correct = bcrypt.compareSync(LoginPassword, userTurista.passwordTurista);
              // SE A SENHA FOR VÁLIDA
              if(correct){
                // AUTORIZA O LOGIN - CRIAREMOS A SESSAO DO USUARIO
                req.session.userTurista = {
                  id : userTurista.id,
                  email : userTurista.emailTurista,
                  nome : userTurista.nomeTurista,
                }
                req.flash('success', `Login efetuado com suceeso! Bem-Vindo ${req.session.userTurista['nome']}`);
                res.redirect("/profileUser");
              // SE A SENHA NÃO FOR VÁLIDA
              } else {
                // EXIBE A MENSAGEM
                req.flash('danger', 'Senha incorreta! Tente novamente.');
                res.redirect("/login");
              }
            }
        });
    //SE O USUARIO NÃO EXISTIR
    } else {
        // EXIBE A MENSAGEM
        req.flash('danger', 'Usuario não cadastrado!')
        res.redirect("/login")
    }
});
  
//ROTA LOGOUT
router.get("/logout", (req, res) => {
    req.session.userCidade = undefined
    req.session.userGuia = undefined
    req.session.userTurista = undefined
    req.flash('danger', 'Logout completo!');
    res.redirect("/home");
});
  
  export default router;