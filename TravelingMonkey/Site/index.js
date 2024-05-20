//https://codepen.io/jpdevries/pen/MoROzK?editors=1000

import express from "express";
import connection from "./config/sequelize-config.js";
const app = express();

connection.authenticate().then(() => {
    console.log("Conexão com o banco realizada com sucesso!")
}).catch((error) => {
    console.log(error)
});

connection.query(`CREATE DATABASE IF NOT EXISTS travelingMonkey;`).then(() => {
    console.log("Banco de dados criado!")
}).catch((error) => {
    console.log(error)
});

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());

import cidadesController from "./controllers/cidadesController.js";
import guiasController from "./controllers/guiasController.js";
import pontosController from "./controllers/pontosController.js";

app.use("/", cidadesController);
app.use("/", guiasController);
app.use("/", pontosController);

app.get("/home", function(req,res){
    res.render("index")
});

//iniciar servidor
app.listen(8080, function(erro){
    if(erro){
        console.log("Ocorreu um erro!")
    } else {
        console.log("Servidor iniciado com sucesso!")
    }
});