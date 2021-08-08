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
    <link rel="stylesheet" type="text/css" href="/css/addsong.css">
    <link rel="stylesheet" href="/css/scrollbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <div id="contenedor">

        <p class="text-end">
            <a href="/profile/${usuario.id}"  class="btn btn-outline-light volver">Volver al perfil</a>
            <a href="/dashboard"  class="btn btn-outline-light volver">Menú</a>
        </p>

        <img class="rounded float-end imagen" src="\css\16 sin título_20210723201644.png">
        <div id="agregar">
            <h1>Añadir Beat</h1>

            <c:if test="${error != null}">
                <small class="d-block text-danger"><c:out value = "${error}"/></small>
            </c:if>

            <form action="" enctype="multipart/form-data" method="POST">
                <input  class="form-control" type="file" name="file" accept=".AAC, .WMA, .WAV, .MP4, .MP3, .FLAC, .M4A">
                <form:form method="POST" action="" modelAttribute="modelBeat">
                    <div class="form-group">
                        <form:label path="title">Título</form:label>
                        <form:input class="form-control" path="title" placeholder="Título del beat"/>
                        <small class="text-danger"><form:errors path="title"/></small>
                    </div>
                    <div>
                        <form:label path="cost">Precio (CLP) </form:label>
                        <div class="form-group input-group mb-3">
                            <span class="input-group-text">$</span>
                            <form:input type="number" class="form-control" path="cost" step="100" min="0"/>
                            <!-- Arreglar el display de esto -->
                            <small class="text-danger d-block"><form:errors path="cost"/></small>
                        </div>
                    </div>
                    <div class="form-group">
                        <form:label path="categories">Añadir Categorías</form:label>
                        <!-- agregar css para que el display de las categorías sea más ordenado -->
                        <p id="letrasGenero">
                            <c:forEach items="${listaCategories}" var="lc">
                            <form:checkbox path="categories" value="${lc.id}"/>
                                <c:out value="${lc.genero}"/>
                            </c:forEach>
                        </p>
                    <div class="form-group">
                    <!-- Arreglar el boton q está un poco desviado xd -->
                    <input type="submit"  class="btn btn-outline-light subir" value="Subir"/>
                </form:form>
            </form>
            <a href="/profile/${usuario.id}">Volver atrás</a>
        </div>
    </div>
</body>
</html>