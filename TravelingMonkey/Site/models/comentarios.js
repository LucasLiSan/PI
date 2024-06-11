import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";
import Turistas from "./turistas.js";

const Feedback = connection.define('comentAvalia', 
    {
        idAvaliador:{
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: Turistas,
                key: 'id'
            }
        },
        idGuiaAvaliado:{
            type: Sequelize.INTEGER,
            allowNull: true
        },
        idPontoAvaliado:{
            type: Sequelize.INTEGER,
            allowNull: true
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

Feedback.belongsTo(Turistas, { foreignKey: 'idAvaliador' });
Feedback.sync({force:false});
export default Feedback;