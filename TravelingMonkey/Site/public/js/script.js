//SLIDER
var swiper = new Swiper('.swiper-container', {
    slidesPerView: 3,
    spaceBetween: 30,
    loop: true,
    autoplay: {
        delay: 6000,
        disableOnInteraction: false,
    },
    breakpoints: {
        // Responsividade
        640: {
            slidesPerView: 1,
            spaceBetween: 20,
        },
        768: {
            slidesPerView: 2,
            spaceBetween: 30,
        },
        1024: {
            slidesPerView: 3,
            spaceBetween: 40,
        },
    }
});

//MODAL MOEDA E IDIOMA
var modal = document.getElementById("myModalCurrency");
var btn = document.getElementById("myBtnCurrency");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function changeCountry() {
    var moedaAtual = document.getElementById("coin");
    var idiomaAtual = document.getElementById("lang");
    var moedaNova = document.getElementById("currencyList");
    var idiomaNova = document.getElementById("languagesList");

    idiomaAtual.innerHTML = idiomaNova.value;
    moedaAtual.innerHTML = moedaNova.value;
}

//MODAL FORM CADASTRO NOVO PONTO
var modalPonto = document.getElementById("myModalNewPonto");
var btnNewPonto = document.getElementById("btnNewPonto");
var spanNewPonto = document.getElementsByClassName("closeModalPonto")[0];

btnNewPonto.onclick = function() {
    modalPonto.style.display = "block";
}

spanNewPonto.onclick = function() {
    modalPonto.style.display = "none";
}

window.onclick = function(event) {
    if (event.target == modalPonto) {
        modalPonto.style.display = "none";
    }
}

//MENUS CADASTRO
document.querySelectorAll('.boxExpand').forEach(box => {
    box.addEventListener('click', function(event) {
        event.stopPropagation(); // Impedir que o clique na caixa propague para o documento

        // Ocultar outras caixas
        document.querySelectorAll('.boxExpand').forEach(otherBox => {
            if (otherBox !== box) {
                otherBox.classList.add('hidden');
            }
        });

        // Expandir a caixa clicada
        box.classList.add('expanded');
    });
});

// Evento para fechar a caixa expandida ao clicar no "x"
document.querySelectorAll('.close-btn').forEach(btn => {
    btn.addEventListener('click', function(event) {
        event.stopPropagation(); // Impedir que o clique no botão propague para a caixa

        // Fechar a caixa expandida
        let box = btn.parentElement;
        box.classList.remove('expanded');

        // Mostrar todas as caixas
        document.querySelectorAll('.box').forEach(box => {
            box.classList.remove('hidden');
        });
    });
});

// Evento para fechar a caixa expandida ao clicar fora dela
document.addEventListener('click', function() {
    document.querySelectorAll('.box.expanded').forEach(box => {
        box.classList.remove('expanded');
    });
    document.querySelectorAll('.box.hidden').forEach(box => {
        box.classList.remove('hidden');
    });
});

//BOTAO EDITS
document.getElementById('editBtnPersonal').addEventListener('click', function() {
    // Seleciona todas as divs que contêm os inputs dos perfis
    var profileDivs = document.querySelectorAll('.cardProfileTuristas');

    profileDivs.forEach(function(div) {
        // Seleciona apenas os inputs e o botão de submit com a classe 'editable' dentro da div atual
        var editableElements = div.querySelectorAll('.editable');

        editableElements.forEach(function(element) {
            // Habilita o input ou botão de submit
            element.disabled = false;
        });
    });
});

document.getElementById('editBtnInfos').addEventListener('click', function() {
    // Seleciona todas as divs que contêm os inputs dos perfis
    var profileDivs = document.querySelectorAll('.cardHistory');

    profileDivs.forEach(function(div) {
        // Seleciona apenas os inputs e o botão de submit com a classe 'editable' dentro da div atual
        var editableElements = div.querySelectorAll('.editable');

        editableElements.forEach(function(element) {
            // Habilita o input ou botão de submit
            element.disabled = false;
        });
    });
});

//EXPANDIR DIV
function toggleDiv(divid){
    if(document.getElementById(divid).style.display == 'none'){
        document.getElementById(divid).style.display = 'flex';
    }else{
        document.getElementById(divid).style.display = 'none';
    }
}

//PERFIL - SETTINGS
function toggleProfile(divid){
    if(document.getElementById(divid).style.display == 'none'){
        document.getElementById(divid).style.display = 'flex';
    }else{
        document.getElementById(divid).style.display = 'none';
    }
}

//MERGESORT
function mergeSort(arr, compare) {
    if (arr.length < 2) {
        return arr;
    }

    const middle = Math.floor(arr.length / 2);
    const left = arr.slice(0, middle);
    const right = arr.slice(middle);

    return merge(mergeSort(left, compare), mergeSort(right, compare), compare);
}

function merge(left, right, compare) {
    const result = [];

    while (left.length && right.length) {
        if (compare(left[0], right[0]) <= 0) {
            result.push(left.shift());
        } else {
            result.push(right.shift());
        }
    }

    return result.concat(left.slice()).concat(right.slice());
}

function compare(a, b, columnIndex, isNumeric) {
    let aValue = a.cells[columnIndex].innerText;
    let bValue = b.cells[columnIndex].innerText;

    if (isNumeric) {
        aValue = parseFloat(aValue) || 0;
        bValue = parseFloat(bValue) || 0;
    }

    if (aValue < bValue) {
        return -1;
    }
    if (aValue > bValue) {
        return 1;
    }
    return 0;
}

function sortTable(columnIndex, isNumeric) {
    const table = document.querySelector('.sortTable tbody');
    const rows = Array.from(table.rows);

    const sortedRows = mergeSort(rows, (a, b) => compare(a, b, columnIndex, isNumeric));

    while (table.firstChild) {
        table.removeChild(table.firstChild);
    }

    sortedRows.forEach(row => table.appendChild(row));
}

document.querySelectorAll('.material-symbols-outlined').forEach((icon, index) => {
    icon.addEventListener('click', () => {
        const isNumeric = index === 2; // Supondo que apenas a terceira coluna (valorEntrada) é numérica
        sortTable(index, isNumeric);
    });
});