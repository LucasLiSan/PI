import PontosTuristicos from "./pontos.js";
import AvaliacoesPontos from "./feedbackPonto.js";
import AvaliacoesGuias from "./feedbackGuia.js";
import PontosAvaliacoes from "./pontoAvaliado.js";
import GuiasAvaliacoes from "./guiaAvaliado.js";
import GuiasDeTurismo from "./guias.js";
import Turistas from "./turistas.js";
import FotosGuias from "./fotosGuias.js";
import FotosPontos from "./fotosPontos.js";
import CategoriasPontos from "./categoriaXponto.js";

// Associações para Avaliações de Pontos Turísticos
// PontosTuristicos and PontosAvaliacoes association
PontosTuristicos.hasMany(PontosAvaliacoes, { foreignKey: 'idPonto', as: 'avaliacoesRelacionadas' });
PontosAvaliacoes.belongsTo(PontosTuristicos, { foreignKey: 'idPonto', as: 'pontoRelacionado' });

// PontosAvaliacoes and AvaliacoesPontos association
PontosAvaliacoes.belongsTo(AvaliacoesPontos, { foreignKey: 'idAvaliacao', as: 'detalheAvaliacao' });
AvaliacoesPontos.hasMany(PontosAvaliacoes, { foreignKey: 'idAvaliacao', as: 'pontosAvaliados' });

// Associações para Avaliações de Guias de Turismo
GuiasDeTurismo.hasMany(GuiasAvaliacoes, { foreignKey: 'idGuia' });
GuiasAvaliacoes.belongsTo(GuiasDeTurismo, { foreignKey: 'idGuia' });

AvaliacoesGuias.hasMany(GuiasAvaliacoes, { foreignKey: 'idAvaliacao' });
GuiasAvaliacoes.belongsTo(AvaliacoesGuias, { foreignKey: 'idAvaliacao' });

// Associações existentes
Turistas.hasMany(AvaliacoesPontos, { foreignKey: 'idAvaliador' });
AvaliacoesPontos.belongsTo(Turistas, { foreignKey: 'idAvaliador' });

Turistas.hasMany(AvaliacoesGuias, { foreignKey: 'idAvaliador' });
AvaliacoesGuias.belongsTo(Turistas, { foreignKey: 'idAvaliador' });

// Associações para Fotos de Pontos Turísticos
PontosTuristicos.hasMany(FotosPontos, { foreignKey: 'idPontoFotografado' });
FotosPontos.belongsTo(PontosTuristicos, { foreignKey: 'idPontoFotografado' });

Turistas.hasMany(FotosPontos, { foreignKey: 'idFotografo' });
FotosPontos.belongsTo(Turistas, { foreignKey: 'idFotografo' });

// Associações para Fotos de Guias de Turismo
GuiasDeTurismo.hasMany(FotosGuias, { foreignKey: 'idGuiaFotografado' });
FotosGuias.belongsTo(GuiasDeTurismo, { foreignKey: 'idGuiaFotografado' });

Turistas.hasMany(FotosGuias, { foreignKey: 'idFotografo' });
FotosGuias.belongsTo(Turistas, { foreignKey: 'idFotografo' });

PontosTuristicos.belongsTo(CategoriasPontos, { foreignKey: 'modalidade', targetKey: 'id', as: 'categoria' });