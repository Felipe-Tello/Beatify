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
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/scrollbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>Editar Canción</title>
</head>
<body>
    <div id="contenedor">
        <nav class="navbar navbar-expand-md fixed-top barra bg-dark">
            <img id="icono" src="/css/5 sin título_20210721162541.png">
            <div class="container-fluid">
                <ul class="nav-menu">
                    <li class="alinear">
                        <a href="/dashboard" class="btn btn-outline-light">volver al menu principal</a>
                    </li>
                    <li class="alinear">
                        <form action="/search" class="d-flex">
                            <input type="search" name="busqueda" class="form-control" placeholder="Search" aria-label="Search">
                            <input type="submit" value="Search" class="btn btn-outline-light">
                        </form>
                    </li>
                    <li class="alinear">
                        <form  method="POST" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="submit" value="Cerrar sesión" class="btn btn-outline-light"/>
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="container contenedordos">
            <p class="text-end">
                <a href="/profile/${usuario.id}"  class="btn btn-outline-light sombra">Volver al perfil</a>
                <a href="/dashboard"  class="btn btn-outline-light volver sombra">Menú</a>
                <a href="/song/${idBeat}" class="btn btn-outline-light subir sombra">Volver atrás</a>
            </p>
            <img class="float-end imagen alinear" src="/css/16 sin título_20210723201644.png">
            <div id="agregar" class="alinear sombra">
                <h1 class="text-center">Editar Beat</h1>

                <c:if test="${error != null}">
                    <small class="d-block text-danger"><c:out value = "${error}"/></small>
                </c:if>

                <form:form method="POST" action="" modelAttribute="beat">

                    <input type="hidden" name="_method" value="put">

                    <div class="form-group">
                        <form:label path="title" class="letra">Título</form:label>
                        <form:input class="form-control" path="title" placeholder="Título del beat"/>
                        <small class="text-danger"><form:errors path="title"/></small>
                    </div>
                    <div>
                        <form:label path="cost" class="letra">Precio</form:label>
                        <div class="form-group input-group mb-3">
                            <span class="input-group-text">$</span>
                            <form:input type="number" class="form-control" path="cost" step="100" min="0"/>
                            <!-- lo mismo acá, modificar el error pa q se vea bonito con css -->
                            <small class="text-danger"><form:errors path="cost"/></small>
                        </div>
                    </div>
                    <div class="form-group letra">
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
            </div>
        </main>
    </div>
</body>
</html>