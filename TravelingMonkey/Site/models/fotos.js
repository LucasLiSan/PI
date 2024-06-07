import Sequelize from "sequelize";
import connection from "../config/sequelize-config.js";

const Imagem = connection.define('imagens', 
    {
        fotos:{
            type: Sequelize.STRING,
            allowNull:false
        },
        dataFoto:{
            type: Sequelize.DATE,
            allowNull: false
        }
    }
);

Imagem.sync({force:false});
export default Imagem;