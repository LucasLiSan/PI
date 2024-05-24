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

const Cidades = connection.define('cidades', 
{
    nomeCidade:{
        type: Sequelize.STRING,
        allowNull:false
    },
    cnpjCidade:{
        type: Sequelize.STRING,
        allowNull:false
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
export {PontosTuristicos, Cidades};
