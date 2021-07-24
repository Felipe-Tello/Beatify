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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    <div id="contenedor">
        <a href="/dashboard"  class="btn btn-outline-light volver">Volver al perfil</a>
        <img class="rounded float-end imagen" src="\css\16 sin título_20210723201644.png">
        <div id="agregar">
            <h1>Añadir Cancion</h1>
            <form action="" enctype="multipart/form-data" method="POST">
                <input  class="form-control" type="file" name="file" accept=".AAC, .WMA, .WAV, .MP4, .MP3, .FLAC, .M4A">
                <form:form method="POST" action="" modelAttribute="modelBeat">

                    <div class="form-group">
                        <form:label path="title">Titulo de la cancion</form:label>
                        <form:input class="form-control" path="title" placeholder="Titulo de la cancion"/>
                    </div>
                    <div>
                        <form:label path="cost">Precio</form:label>
                        <div class="form-group input-group mb-3">
                            <span class="input-group-text">$</span>
                            <form:input class="form-control" path="cost" placeholder="Precio"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <form:select path="categories" class="form-select"> 
                            <c:forEach items="${listaCategories}" var="lc">
                                <form:option value="${lc.id}">
                                    <c:out value="${lc.genero}"></c:out>
                                </form:option>
                            </c:forEach>
                        </form:select>
                    <div class="form-group">
                    <input type="submit"  class="btn btn-outline-light subir" value="subir cancion"/>
                </form:form>
            </form>
        </div>
    </div>
</body>
</html>