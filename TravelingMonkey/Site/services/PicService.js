import fotos from "../models/fotos.js";

class PicService {
    Save(file) {
        fotos.create({
            file : file
        });
    }
    SelectPictures() {
        const foto = fotos.findAll();
        return foto;
    }
}

export default new PicService();