<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/addsong.css">
    <title>Editar Canción</title>
</head>
<body>
  
    <div class="contenedor">

        <p class="text-end">
            <a href="/profile/${usuario.id}"  class="btn btn-outline-light volver">Volver al perfil</a>
            <a href="/dashboard"  class="btn btn-outline-light volver">Menú</a>
        </p>

        <img class="rounded float-end imagen" src="\css\16 sin título_20210723201644.png">
        <div id="agregar">
            <h1>Editar Beat</h1>

            <c:if test="${error != null}">
                <small class="d-block text-danger"><c:out value = "${error}"/></small>
            </c:if>

            <form:form method="POST" action="" modelAttribute="beat">

                <input type="hidden" name="_method" value="put">

                <div class="form-group">
                    <form:label path="title">Título</form:label>
                    <form:input class="form-control" path="title" placeholder="Título del beat"/>
                    <small class="text-danger"><form:errors path="title"/></small>
                </div>
                <div>
                    <form:label path="cost">Precio</form:label>
                    <div class="form-group input-group mb-3">
                        <span class="input-group-text">$</span>
                        <form:input type="number" class="form-control" path="cost" step="100" min="0"/>
                        <!-- lo mismo acá, modificar el error pa q se vea bonito con css -->
                        <small class="text-danger"><form:errors path="cost"/></small>
                    </div>
                </div>
                <div class="form-group">
                    <form:label path="categories" class="d-block">Añadir categorías. Si desea mantener las actuales, debe seleccionarlas.</form:label>
                    <!-- cambiar color pofavo -->
                    <small class="d-block">Actuales: 
                        <c:forEach items="${beat.categories}" var="lc">
                            <c:out value="${lc.genero} "/>
                        </c:forEach>
                    </small>

                    <c:forEach items="${listaCategories}" var="lc">
                        <form:checkbox path="categories" value="${lc.id}"/>
                            <c:out value="${lc.genero}"/>
                    </c:forEach>
               
                <div class="form-group">
                <input type="submit"  class="btn btn-outline-light subir" value="Editar"/>
            </form:form>
            <a href="/song/${idBeat}">Volver atrás</a>
        </div>
    </div>
</body>
</html>