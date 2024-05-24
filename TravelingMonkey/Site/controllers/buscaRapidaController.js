import express from "express";
import PontosTuristicos from "../models/pontos.js";
import Cidades from "../models/cidades.js";
import Guias from "../models/guias.js";

const router = express.Router();

//ALGORITIMO MERGESORT
function mergeSort(arr, key) {
    if (arr.length <= 1) {
        return arr;
    }

    const middle = Math.floor(arr.length / 2);
    const left = arr.slice(0, middle);
    const right = arr.slice(middle);

    return merge(mergeSort(left, key), mergeSort(right, key), key);
}

function merge(left, right, key) {
    let resultArray = [], leftIndex = 0, rightIndex = 0;

    //FASE DE DIVISÃO
    while (leftIndex < left.length && rightIndex < right.length) {
        if (left[leftIndex][key] < right[rightIndex][key]) {
            resultArray.push(left[leftIndex]);
            leftIndex++; // move left array cursor
        } else {
            resultArray.push(right[rightIndex]);
            rightIndex++; // move right array cursor
        }
    }

    //FASE DE CONQUISTA
    return resultArray
            .concat(left.slice(leftIndex))
            .concat(right.slice(rightIndex));
}

//ROTA BUSCA RAPIDA CIDADES
router.get('/cidades', function(req, res) {
    PontosTuristicos.findAll().then(cidades => {
        const sortedCidades = mergeSort(cidades, 'nome');
        res.render("cidades", {
            cidades: sortedCidades
        });
    });
});

//ROTA BUSCA RAPIDA PONTOS
router.get('/pontos', function(req, res) {
    PontosTuristicos.findAll().then(pontos => {
        const sortedPontos = mergeSort(pontos, 'pontoTuristico');
        res.render("pontos", {
            pontos: sortedPontos
        });
    });
});

//ROTA BUSCA RAPIDA GUIAS
router.get('/guias', function(req, res) {
    PontosTuristicos.findAll().then(guias => {
        const sortedGuias = mergeSort(guias, 'operacao');
        res.render("guias", {
            guias: sortedGuias
        });
    });
});

export default router;