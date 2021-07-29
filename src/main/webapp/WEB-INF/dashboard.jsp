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
    <title>Document</title>
</head>
<body>
    <div class="container">
    <!-- FORMULARIO PARA CERRAR SESIÓN -->
        <form method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Cerrar sesión" />
        </form>
        <br>
        <a href="/profile/${userActual.id}">ir al perfil</a>
        <br>
        <a href="/wishlist/${userActual.id}">Wishlist</a>
        <h1>Welcome <c:out value="${userActual.firstName}"></c:out></h1>
        <c:if test="${permiso == true}">
            <p>
                <a href="/admin">Página de administrador</a>
            </p>
        </c:if>
        <h3>Canciones de artistas cercanos a <c:out value="${userActual.region}"></c:out></h3>
        <table class="table table-striped table-hover">
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
                    <td><c:out value="${lb.title}"/></td>
                    <td><c:out value="${lb.cost}"/></td>
                    <td>
                        <audio controls src="${lb.url}">
                            Your browser does not support the audio element.
                        </audio>
                    </td>
                    <td>
                        <c:out value="${lb.usersLike.size()}"/>
                        <c:if test="${!lb.usersLike.contains(userActual)}"><a href="/like/${lb.id}?ruta=dashboard">Like</a></c:if>
                        <c:if test="${lb.usersLike.contains(userActual)}"><a href="/dislike/${lb.id}?ruta=dashboard">Dislike</a></c:if>
                    </td>
                    <td>
                        <c:if test="${userActual.id != lb.uCreador.id && !lb.wishlistuser.contains(userActual)}"><a href="/addwishlist/${lb.id}?ruta=dashboard">Add lo wish list</a></c:if>
                        <c:if test="${userActual.id != lb.uCreador.id && lb.wishlistuser.contains(userActual)}"><a href="/removewishlist/${lb.id}?ruta=dashboard">Remove from wish list</a></c:if>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>