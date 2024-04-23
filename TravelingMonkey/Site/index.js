import express from 'express';
const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));

app.listen(8080,function(erro){
    if(erro) {
        console.log("Ocorreu um erro!")
    } else {
        console.log("Servidor iniciado com sucesso!")
    }
});