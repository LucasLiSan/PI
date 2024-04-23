import express from "express";
const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

import pedidosController from "./controllers/pedidosController.js";
app.use("/", pedidosController);

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