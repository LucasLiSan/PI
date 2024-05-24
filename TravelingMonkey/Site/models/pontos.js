import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const PontosTuristicos = connection.define('pontos', 
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

PontosTuristicos.sync({force:false});

export default PontosTuristicos;
