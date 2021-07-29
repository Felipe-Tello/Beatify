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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/comentarios.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <form method="POST" action="/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Cerrar sesión" />
        </form>
        <a href="/dashboard">volver al menu principal</a>
        <br>
            <a href="/wishlist/${userActual.id}">Wishlist</a>
        <br>
        <c:if test="${userActual.id == user.id}">
            <a href="/profile/${user.id}/edit">Editar perfil</a>
        </c:if>
        <br>
        <c:if test="${userActual.id == user.id}">
            <a href="/song/new">Añadir cancion</a>
        </c:if>
        <c:if test="${respectTotal >= 0 && respectTotal <=5}"><img src="/ranges/1.png" alt="" width="280" height="300"></c:if>
        <c:if test="${respectTotal > 5 && respectTotal <=10}"><img src="/ranges/2.png" alt="" width="280" height="300"></c:if>
        <c:if test="${respectTotal > 10 && respectTotal <=15}"><img src="/ranges/3.png" alt="" width="280" height="300"></c:if>
        <c:if test="${respectTotal > 15 && respectTotal <= 20}"><img src="/ranges/4.png" alt="" width="280" height="300"></c:if>
        <c:if test="${respectTotal > 20 && respectTotal <= 25}"><img src="/ranges/5.png" alt="" width="280" height="300"></c:if>
        <c:if test="${respectTotal > 25}"><img src="/ranges/6.png" alt="" width="280" height="300"></c:if>
        <h1>Nombre: <c:out value="${user.firstName}"></c:out></h1>
        <h1>Apellido: <c:out value="${user.lastName}"></c:out></h1>
        <h1>Region: <c:out value="${user.region}"></c:out></h1>
        <h1>Respeto: <c:out value="${respectTotal}"></c:out></h1>

        <h4>Tus Canciones</h4>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Reproductor</th>
                    <th>Respect</th>
                    <th>Wish List</th>
                    <th>Messages</th>
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
                    <td>
                        <c:out value="${lb.usersLike.size()}"/>
                        <c:if test="${!lb.usersLike.contains(userActual)}"><a href="/like/${lb.id}?ruta=profile">Like</a></c:if>
                        <c:if test="${lb.usersLike.contains(userActual)}"><a href="/dislike/${lb.id}?ruta=profile">Dislike</a></c:if>
                    </td>
                    <td>
                        <c:if test="${userActual.id != lb.uCreador.id && !lb.wishlistuser.contains(userActual)}"><a href="/addwishlist/${lb.id}?ruta=profile">Add lo wish list</a></c:if>
                        <c:if test="${userActual.id != lb.uCreador.id && lb.wishlistuser.contains(userActual)}"><a href="/removewishlist/${lb.id}?ruta=profile">Remove from wish list</a></c:if>
                    </td>
                    <td><a href="/profile/${user.id}/${lb.id}">comentarios</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <h1>Message Wall</h1>
        <p>
            <textarea readonly rows="10" cols="40"><c:out value="${data}"/></textarea>
        </p>
        <h4>Add comment:</h4>
        <form action="" method="post" >
            <p>
                <label path="comment"></label>
                <errors path="comment"/>
                <textarea path="comment" name="content" cols="20" rows="1"></textarea>
            </p>
            <input type="submit" value="Submit"/>
        </form>
    </div>
</body>
</html>