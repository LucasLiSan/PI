import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";
import GuiasDeTurismo from "./guias.js";
import Turistas from "./turistas.js";
import PontosTuristicos from "./pontos.js";
import Imagem from "./fotos.js";

const GuiasFotografados = connection.define('fotosXGuiaFotografados',
    {
        idFoto: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: Imagem,
                key: 'id'
            }
        },
        idTurista: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: Turistas,
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

Fotografados.belongsTo(Imagem, { foreignKey: 'idFoto'});
Fotografados.belongsTo(Turistas, { foreignKey: 'idTurista'});
Fotografados.belongsTo(GuiasDeTurismo, { foreignKey: 'idGuia'});
Fotografados.belongsTo(PontosTuristicos, { foreignKey: 'idPonto'});

Fotografados.sync({force:false});
export default Fotografados;