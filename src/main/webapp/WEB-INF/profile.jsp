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
    <a href="/dashboard">volver al menu principal</a>
    <br>
    <a href="/profile/${user.id}/edit">Editar perfil</a>
    <br>
    <a href="/song/new">Añadir cancion</a>
    <h1>Nombre: <c:out value="${user.firstName}"></c:out></h1>
    <h1>Apellido: <c:out value="${user.lastName}"></c:out></h1>
    <h1>Region: <c:out value="${user.region}"></c:out></h1>

    <h4>Tus Canciones</h4>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Reproductor</th>
                    <th>Respect</th>
                    <th>Wish List</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaBeats}" var="lb">
                <tr>
                    <td><c:out value="${lb.title}"/></td>
                    <td><c:out value="${lb.cost}"/></td>
                    <td>
                        <audio controls>
                            <source src="${lb.url}" type="audio/ogg">
                            <source src="${lb.url}" type="audio/mpeg">
                            Your browser does not support the audio element.
                        </audio>
                    </td>
                    <td><a href="/like/${lb.id}?ruta=profile">Like</a><a href="/dislike/${lb.id}?ruta=profile">Dislike</a><c:out value="${lb.usersLike.size()}"/></td>
                    <td><a href="/addwishlist/${lb.id}?ruta=profile">Add lo wish list</a><a href="/removewishlist/${lb.id}?ruta=profile">Remove from wish list</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
</body>
</html>