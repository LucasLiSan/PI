import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const Feedback = connection.define('comentAvalia', 
    {
        idAvaliador:{
            type: Sequelize.INTEGER,
            allowNull: false
        },
        idGuiaAvaliado:{
            type: Sequelize.INTEGER,
            allowNull: false
        },
        idPontoAvaliado:{
            type: Sequelize.INTEGER,
            allowNull: false
        },
        nota:{
            type: Sequelize.INTEGER,
            allowNull: false
        },
        comentario:{
            type: Sequelize.STRING,
            allowNull: true
        },
        dataAvaliacao:{
            type: Sequelize.DATE,
            allowNull: false
        }
    }
);

Feedback.sync({force:false});
export default Feedback;