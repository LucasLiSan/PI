import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const PontosTuristicos = connection.define('pontos', 
{
    nomePonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    descricaoPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    idCategoria:{
        type: Sequelize.INTEGER,
        allowNull:false
    },
    valorEntrada:{
        type: Sequelize.REAL(6,2),
        allowNull:false
    },
    endRuaPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endBairroPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endNumPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endCidadePonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endUfPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endCepPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endReferenciaPonto:{
        type: Sequelize.STRING,
        allowNull:false
    },
    endGeoLatPonto:{
        type: Sequelize.DECIMAL(10, 8),
        allowNull:false
    },
    endGeoLongePonto:{
        type: Sequelize.DECIMAL(11, 8),
        allowNull:false
    },
    profilePicPonto:{
        type: Sequelize.STRING,
        allowNull:true
    }
});

PontosTuristicos.sync({force:false});

export default PontosTuristicos;
