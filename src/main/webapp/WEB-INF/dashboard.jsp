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
</head>
<body>
    <!-- FORMULARIO PARA CERRAR SESIÓN -->
    <form method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Cerrar sesión" />
    </form>

    <br>
    <a href="/profile/${Usuario.id}">ir al perfil</a>
    <br>
    <a href="/wishlist/${Usuario.id}">Wishlist</a>
    <h1>Welcome <c:out value="${Usuario.firstName}"></c:out></h1>
    <c:if test="${permiso == true}">
        <p>
            <a href="/admin">Página de administrador</a>
        </p>
    </c:if>
    <h3>Canciones de artistas cercanos a <c:out value="${Usuario.region}"></c:out></h3>
    <table>
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
                <td><c:out value="${lb.uCreador.firstName}"/></td>
                <td><c:out value="${lb.title}"/></td>
                <td><c:out value="${lb.cost}"/></td>
                <td>
                    <audio controls src="${lb.url}">
                        Your browser does not support the audio element.
                    </audio>
                </td>
                <td><a href="/like/${lb.id}?ruta=dashboard">Like</a><a href="/dislike/${lb.id}?ruta=dashboard">Dislike</a><c:out value="${lb.usersLike.size()}"/></td>
                <td><a href="/addwishlist/${lb.id}?ruta=dashboard">Add lo wish list</a><a href="/removewishlist/${lb.id}?ruta=dashboard">Remove from wish list</a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>