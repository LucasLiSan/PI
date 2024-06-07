import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";
import PontosTuristicos from "./pontos.js";
import GuiasDeTurismo from "./guias.js";
import Feedback from "./comentarios.js";

const Avaliados = connection.define('avaliacaoXavaliado',
    {
        idAvaliacao: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: Feedback,
                key: 'id'
            }
        },
        idGuia: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: GuiasDeTurismo,
                key: 'id'
            }
        },
        idPonto: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: PontosTuristicos,
                key: 'id'
            }
        }
    }
);

Avaliados.belongsTo(Feedback, { foreignKey: 'idAvaliacao'});
Avaliados.belongsTo(GuiasDeTurismo, { foreignKey: 'idGuia'});
Avaliados.belongsTo(PontosTuristicos, { foreignKey: 'idPonto'});

Avaliados.sync({force:false});
export default Avaliados;