import express from "express";
import bcrypt from "bcrypt";
import session from "express-session";
import Turistas from "../models/turistas.js";
import { PontosTuristicos, Cidades } from "../models/pontos.js";
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
    const nomeCidade = req.body.nomeCidade;
    const cnpj = req.body.cnpj;
    //const formattedDate = formatDate(dataNascimento);
  
    // VERIFICA SE O USUÁRIO JÁ ESTÁ CADASTRADO NO BANCO
    Cidades.findOne({where: {email : email}}).then(cidade => {
      // SE NÃO HOUVER
      if(cidade == undefined){
        // AQUI SERÁ FEITO O CADASTRO
        const salt = bcrypt.genSaltSync(10)
        const hash = bcrypt.hashSync(password, salt)
        Cidades.create({
          nomeCidade : nomeCidade,
          cnpjCidade : cnpj,
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
router.post("/auth", (req, res) => {
    const email = req.body.email
    const password = req.body.password
  
    // BUSCA O USUÁRIO NO BANCO
    Cidades.findOne({where: {email : email}}).then(cidade => {
      // SE O USUÁRIO EXISTIR
      if (cidade != undefined) { 
        // VALIDA A SENHA
        const correct = bcrypt.compareSync(password, cidade.password)
        // SE A SENHA FOR VÁLIDA
        if(correct){
          // AUTORIZA O LOGIN - CRIAREMOS A SESSAO DO USUARIO
          req.session.cidade = {
            id : cidade.id,
            email : cidade.email
          }
          //res.send(`Usuario logado: <br> ID : ${req.session.user['id']}<br> E-mail: ${req.session.user['email']}`)
          req.flash('success', 'Login efetuado com suceeso!')
          res.redirect("/home")
        // SE A SENHA NÃO FOR VÁLIDA
        } else {
          // EXIBE A MENSAGEM
          req.flash('danger', 'Senha incorreta! Tente novamente.')
          res.redirect("/login")
        }
      // SE O USÁRIO NÃO EXISTIR
      } else {
        // EXIBE A MENSAGEM
          req.flash('danger', 'Usuario não cadastrado!')
          res.redirect("/login")
      }
    })
  })

export default router;