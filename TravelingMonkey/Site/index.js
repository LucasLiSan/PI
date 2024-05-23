//https://codepen.io/jpdevries/pen/MoROzK?editors=1000

//IMPORTANDO OS MODULOS
import express from "express";
import connection from "./config/sequelize-config.js";
import session from "express-session";
import flash from "express-flash";

//INICIANDO O EXPRESS
const app = express();

//CRIANDO AS CONEXÕES E CRIANDO O BANCO
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

//DEFINIÇÕES
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(flash());
app.use(session({
    secret: "Iwazaru",
    cookie: {maxAge: 120000},
    saveUninitialized: false,
    resave: false
}));

//IMPORTANDO OS CONTROLLERS E DEFININDO O USO DAS ROTAS
import cidadesController from "./controllers/buscaController.js";
import guiasController from "./controllers/guiasController.js";
import pontosController from "./controllers/pontosController.js";
import usersController from "./controllers/usersController.js";
import reservasController from "./controllers/reservasController.js";

app.use("/", cidadesController);
app.use("/", guiasController);
app.use("/", pontosController);
app.use("/", usersController);
app.use("/", reservasController);

//ROTA PRINCIPAL
app.get("/home", function(req,res){
    res.render("index")
});

//INICIANDO O SERVIDOR
app.listen(8080, function(erro){
    if(erro){
        console.log("Ocorreu um erro!")
    } else {
        console.log("Servidor iniciado com sucesso!")
    }
});