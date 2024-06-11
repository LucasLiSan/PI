import PontosTuristicos from "./pontos.js";
import Feedback from "./comentarios.js";
import Avaliados from "./avaliacaoXavaliado.js";
import GuiasDeTurismo from "./guias.js";
import Turistas from "./turistas.js";

// Associações
PontosTuristicos.hasMany(Avaliados, { foreignKey: 'idPonto' });
Avaliados.belongsTo(PontosTuristicos, { foreignKey: 'idPonto' });

Feedback.hasMany(Avaliados, { foreignKey: 'idAvaliacao' });
Avaliados.belongsTo(Feedback, { foreignKey: 'idAvaliacao' });

GuiasDeTurismo.hasMany(Avaliados, { foreignKey: 'idGuia' });
Avaliados.belongsTo(GuiasDeTurismo, { foreignKey: 'idGuia' });

Turistas.hasMany(Feedback, { foreignKey: 'idAvaliador' });
Feedback.belongsTo(Turistas, { foreignKey: 'idAvaliador' });

// Adicionar associação Feedback <-> PontosTuristicos
PontosTuristicos.hasMany(Feedback, { foreignKey: 'idPontoAvaliado' });
Feedback.belongsTo(PontosTuristicos, { foreignKey: 'idPontoAvaliado' });

// Adicionar associação Feedback <-> GuiasDeTurismo
GuiasDeTurismo.hasMany(Feedback, { foreignKey: 'idGuiaAvaliado' });
Feedback.belongsTo(GuiasDeTurismo, { foreignKey: 'idGuiaAvaliado' });
