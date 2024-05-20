import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const Cidades = connection.define('cidades', 
{
    nome:{
        type: Sequelize.STRING,
        allowNull:false
    },
    pontoTuristico:{
        type: Sequelize.STRING,
        allowNull:false
    },
    operacao:{
        type: Sequelize.STRING,
        allowNull:false
    }
});

Cidades.sync({force:false});

export default Cidades;