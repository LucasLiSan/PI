import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const HorarioPonto = connection.define('horarioXpontos', 
{
    idHorario: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    idPontoTuristico: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});

HorarioPonto.sync({force:false});
export default HorarioPonto;