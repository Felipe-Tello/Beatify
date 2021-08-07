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
    <link rel="shortcut icon" href="/css/BTLogo.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link rel="stylesheet" type="text/css" href="/css/scrollbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Editar Canción</title>
</head>
<body>
    <div id="contenedor">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container-fluid">
                <a href="/dashboard" class="navbar-brand"><img id="icono" src="/css/5 sin título_20210721162541.png" alt="dashboard"></a>
    
                <button type="button" class="navbar-toggler" data-bs-toggle="offcanvas" data-bs-target="#menu" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
    
                <div class="offcanvas offcanvas-end bg-dark" tabindex="-1" id="menu" aria-labelledby="offcanvasNavbarLabel">
    
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title text-white" id="offcanvasNavbarLabel">Bienvenido, <c:out value="${userActual.firstName}"></c:out></h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
    
                    <div class="offcanvas-body">
                        <ul class="navbar-nav flex-grow-1 pe-3">
                            <li class="nav-item">
                                <c:if test="${permiso == true}">
                                    <a href="/admin" class="nav-link">Página de administrador</a>
                                </c:if>
                            </li>
                            <li class="nav-item">
                                <a href="/profile/${userActual.id}" class="nav-link">Ir al perfil</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="categorias" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                  Categorías
                                </a>
                                <ul class="dropdown-menu bg-dark" aria-labelledby="categorias">
                                    <!-- ver esta wa -->
                                    <c:forEach items="${listaCategories}" var="lc">
                                        <li class="nav-item">
                                            <a href="/categories/${lc.id}" class="nav-link"><c:out value="${lc.genero}"/></a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="/wishlist/${userActual.id}" class="nav-link">Carrito</a>
                            </li>
                            <li class="nav-item">
                                <form  method="POST" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="submit" value="Cerrar Sesión" class="btn nav-link"/>
                                </form>
                            </li>
                            <li class="nav-item">
                        </ul>
                        
                        <form action="/search" class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Canción/Artista" aria-label="Search" name="busqueda">
                            <button class="btn btn-outline-success" type="submit" value="Search">Buscar</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <main role="main" class="container contenedordos">
            <p class="text-end">
                <a href="/profile/${userActual.id}"  class="btn btn-outline-light sombra">Volver al perfil</a>
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