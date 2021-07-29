$(document).ready(function () {

})

function like(id) {
    alert(id)
    $.ajax({
        type:"get",
        url:"/like/"+id
    })
    .done(function(respuesta){
        console.log(respuesta)
    })
    .fail(function(respuesta){
        console.log(respuesta + "error")
    })
}