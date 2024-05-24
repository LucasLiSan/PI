import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const Cidades = connection.define('cidades', 
{
    nome:{
        type: Sequelize.STRING,
        allowNull:false
    },
    cnpj:{
        type: Sequelize.STRING,
        allowNull:true
    },
    email:{
        type: Sequelize.STRING,
        allowNull:false
    },
    password: {
        type: Sequelize.STRING,
        allowNull:false
    }
});

Cidades.sync({force:false});

export default Cidades;