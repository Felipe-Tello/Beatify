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
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->
    <!-- <script src="/js/comentarios.js"></script> -->
</head>
<body>
    <div id="contenedor">
    <!-- FORMULARIO PARA CERRAR SESIÓN -->
        <img id="icono" class="alinear" src="/css/5 sin título_20210721162541.png">

        <c:if test="${errorSong != null}">
            <p class="text-danger"><c:out value = "${errorSong}"/></p>
        </c:if>

        <c:if test="${errorUser != null}">
            <p class="text-danger"><c:out value = "${errorUser}"/></p>
        </c:if>

        <ul class="float-end padd">
            <li class="alinear sombra">
                <c:if test="${permiso == true}">
                    <a href="/admin" class="btn btn-outline-light">Página de administrador</a>
                </c:if>
            </li>
            <li  class="alinear sombra">
                <a href="/profile/${userActual.id}" class="btn btn-outline-light">ir al perfil</a>
            </li>
            <li  class="alinear sombra">
                <!-- FORMULARIO PARA CERRAR SESIÓN -->
                <form:form method="POST" action="/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Cerrar sesión" class="btn btn-outline-light"/>
                </form:form>
            </li>
        </ul>
        <h1>Welcome <c:out value="${userActual.firstName}"></c:out></h1>
        <a href="/wishlist/${userActual.id}" class="btn btn-outline-light float-end padd sombra">Wishlist</a>
        <h3>Canciones de artistas cercanos a <c:out value="${userActual.region}"></c:out></h3>
        <c:forEach items="${listaCategories}" var="lc"> 
            <a href="/categories/${lc.id}"><c:out value="${lc.genero}"/></a>
        </c:forEach>
        <c:forEach items="${category.beats}" var="cb"> 
            <c:out value="${cb.title}"/>
        </c:forEach>
        <div id="tabla">
            <table class="table table-dark table-sm table-responsive">
                <thead>
                    <tr>
                        <th>Autor</th>
                        <th>Titulo</th>
                        <th>Price</th>
                        <th>Reproductor</th>
                        <th>Respect</th>
                        <th>Wish List</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listaBeats}" var="lb">
                    <tr>
                        <td><a href="/profile/${lb.uCreador.id}"><c:out value="${lb.uCreador.firstName}"/></a></td>
                        <td><a href="/song/${lb.id}"><c:out value="${lb.title}"/></a></td>
                        <td><c:out value="${lb.cost}"/></td>
                        <td>
                            <audio controls src="${lb.url}" class="btn btn-dark">
                                Your browser does not support the audio element.
                            </audio>
                        </td>
                        <td>
                            <c:out value="${lb.usersLike.size()}"/>
                            <c:if test="${!lb.usersLike.contains(userActual)}"><a href="/like/${lb.id}?ruta=dashboard" class="btn btn-outline-info">Like</a></c:if>
                            <c:if test="${lb.usersLike.contains(userActual)}"><a href="/dislike/${lb.id}?ruta=dashboard" class="btn btn-outline-danger">Dislike</a></c:if>
                        </td>
                        <td>
                            <c:if test="${userActual.id != lb.uCreador.id && !lb.wishlistuser.contains(userActual)}"><a href="/addwishlist/${lb.id}?ruta=dashboard" class="btn btn-outline-light">Add lo wish list</a></c:if>
                            <c:if test="${userActual.id != lb.uCreador.id && lb.wishlistuser.contains(userActual)}"><a href="/removewishlist/${lb.id}?ruta=dashboard" class="btn btn-outline-light">Remove from wish list</a></c:if>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>