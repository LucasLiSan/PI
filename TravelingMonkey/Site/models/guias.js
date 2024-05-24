import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const GuiasDeTurismo = connection.define('guiasDeTurismo', 
{
    nome:{
        type: Sequelize.STRING,
        allowNull:false
    },
    email:{
        type: Sequelize.STRING,
        allowNull:false
    },
    password:{
        type: Sequelize.STRING,
        allowNull:false
    }
});

GuiasDeTurismo.sync({force:false});

export default GuiasDeTurismo;