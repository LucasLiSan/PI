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