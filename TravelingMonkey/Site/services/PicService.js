import FotosGuias from "../models/fotosGuias.js";
import FotosPontos from "../models/fotosPontos.js";
import PontosTuristicos from "../models/pontos.js";

class PicService {
    SaveGuia(file, idGuiaFotografado, idFotografo) {
        FotosGuias.create({
            fotos: file,
            idGuiaFotografado: idGuiaFotografado,
            idFotografo: idFotografo,
            dataFoto: new Date()
        });
    }

    SavePonto(file, idPontoFotografado, idFotografo) {
        FotosPontos.create({
            fotos: file,
            idPontoFotografado: idPontoFotografado,
            idFotografo: idFotografo,
            dataFoto: new Date()
        });
    }

    SaveProfilePic(file, profilePic) {
        PontosTuristicos.create({
            profilePic: file,
        });
    }

    SelectPicturesGuias() { return FotosGuias.findAll(); }
    SelectPicturesPontos() { return FotosPontos.findAll(); }
}

export default new PicService();