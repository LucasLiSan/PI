import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const Turistas = connection.define('turistas', 
{
    nomeTurista:{
        type: Sequelize.STRING,
        allowNull:false
    },
    nascTurista:{
        type:Sequelize.DATE,
        allowNull: false
    },
    emailTurista:{
        type: Sequelize.STRING,
        allowNull:false
    },
    passwordTurista:{
        type: Sequelize.STRING,
        allowNull:false
    }
});

Turistas.sync({force:false});

export default Turistas;