import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const GuiasDeTurismo = connection.define('guiasDeTurismo', 
{
    nomeGuia:{
        type: Sequelize.STRING,
        allowNull:false
    },
    emailGuia:{
        type: Sequelize.STRING,
        allowNull:false
    },
    passwordGuia:{
        type: Sequelize.STRING,
        allowNull:false
    }
});

GuiasDeTurismo.sync({force:false});

export default GuiasDeTurismo;