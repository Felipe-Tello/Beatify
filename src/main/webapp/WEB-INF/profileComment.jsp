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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
        <a href="/wishlist/${Usuario.id}">Wishlist</a>
        <br>
        <c:if test="${userActual.id == user.id}">
            <a href="/profile/${user.id}/edit">Editar perfil</a>
        </c:if>
        <br>
        <c:if test="${userActual.id == user.id}">
            <a href="/song/new">Añadir cancion</a>
        </c:if>
        <br>
        <h1>Nombre: <c:out value="${user.firstName}"></c:out></h1>
        <h1>Apellido: <c:out value="${user.lastName}"></c:out></h1>
        <h1>Region: <c:out value="${user.region}"></c:out></h1>

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
                            <c:if test="${!lb.usersLike.contains(userActual)}"><a href="/like/${lb.id}?ruta=profileComment">Like</a></c:if>
                            <c:if test="${lb.usersLike.contains(userActual)}"><a href="/dislike/${lb.id}?ruta=profileComment">Dislike</a></c:if>
                        </td>
                        <td>
                            <c:if test="${userActual.id != lb.uCreador.id && !lb.wishlistuser.contains(userActual)}"><a href="/addwishlist/${lb.id}?ruta=profileComment">Add lo wish list</a></c:if>
                            <c:if test="${userActual.id != lb.uCreador.id && lb.wishlistuser.contains(userActual)}"><a href="/removewishlist/${lb.id}?ruta=profileComment">Remove from wish list</a></c:if>
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
        <form:form action="" method="post" modelAttribute="messageModel">
            <p>
                <form:label path="comment"></form:label>
                <form:errors path="comment"/>
                <form:textarea path="comment" name="content" cols="20" rows="1"></form:textarea>
            </p>
            <input type="submit" value="Submit"/>
        </form:form>
    </div>
</body>
</html>