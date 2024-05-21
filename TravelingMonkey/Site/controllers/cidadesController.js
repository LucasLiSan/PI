import express from "express";
import Cidades from "../models/cidades.js";
const router = express.Router();

// Função de Merge Sort
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

    // Ordenar os elementos comparando as chaves
    while (leftIndex < left.length && rightIndex < right.length) {
        if (left[leftIndex][key] < right[rightIndex][key]) {
            resultArray.push(left[leftIndex]);
            leftIndex++; // move left array cursor
        } else {
            resultArray.push(right[rightIndex]);
            rightIndex++; // move right array cursor
        }
    }

    // Concatenar o resto dos elementos
    return resultArray
            .concat(left.slice(leftIndex))
            .concat(right.slice(rightIndex));
}

router.get('/cidades', function(req, res) {
    Cidades.findAll().then(cidades => {
        const sortedCidades = mergeSort(cidades, 'nome');
        res.render("cidades", {
            cidades: sortedCidades
        });
    });
});


export default router;