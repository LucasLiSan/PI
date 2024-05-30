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


//MENUS CADASTRO
document.querySelectorAll('.box').forEach(box => {
    box.addEventListener('click', function(event) {
        event.stopPropagation(); // Impedir que o clique na caixa propague para o documento

        // Ocultar outras caixas
        document.querySelectorAll('.box').forEach(otherBox => {
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
        // Seleciona todos os inputs dentro da div atual
        var inputs = div.querySelectorAll('input');

        inputs.forEach(function(input) {
            // Habilita o input
            input.disabled = false;
        });
    });
});