$(document).ready(function () {

})

function like(id, ruta) {
    url = `/${ruta}/${id}?ruta=dashboard`;
    $.ajax({
        type:"get",
        url: url
    })
    .done(function(respuesta){
        let likes = document.getElementById(id)
        let contador = likes.querySelector("span")
        contador.innerHTML = respuesta
        let boton = likes.querySelector("a")

        if(boton.classList.item(1) == "btn-outline-info") {
            boton.classList.replace("btn-outline-info", "btn-outline-danger")
            boton.innerHTML = "Dislike"
            boton.setAttribute("onClick", "like("+id+", 'dislike')")
        }
        else {
            boton.classList.replace("btn-outline-danger", "btn-outline-info")
            boton.innerHTML = "Like"
            boton.setAttribute("onClick", "like("+id+", 'like')")
        }
    })
    .fail(function(respuesta){
        console.log(respuesta + "error")
    })
}

function wish(id, ruta) {
    let value = document.querySelector()
    url = `/${ruta}/${id}?ruta=dashboard`;
    $.ajax({
        type:"get",
        url: url
    })
    .done(function(respuesta){
        let likess = document.getElementById(id)
        let botonn = likess.querySelector("a")
        botonn.innerHTML = respuesta

        if(boton.innerHTML = "Añadir al carro") {
            botonn.innerHTML = "Remover del carro"
            botonn.setAttribute("onClick", "wish("+id+", 'addwishlist')")
        }
        else {
            botonn.innerHTML = "Añadir al carro"
            botonn.setAttribute("onClick", "wish("+id+", 'removewishlist')")
        }
    })
    .fail(function(respuesta){
        console.log(respuesta + "error")
    })
}
