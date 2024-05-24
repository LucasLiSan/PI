import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const Turistas = connection.define('turistas', 
{
    nome:{
        type: Sequelize.STRING,
        allowNull:false
    },
    nascimento:{
        type:Sequelize.DATE,
        allowNull: true
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

Turistas.sync({force:false});

export default Turistas;