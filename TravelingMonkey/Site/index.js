//https://codepen.io/jpdevries/pen/MoROzK?editors=1000

import express from "express";
const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

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