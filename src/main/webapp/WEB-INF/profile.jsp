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
    <link rel="stylesheet" type="text/css" href="/css/profile.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/comentarios.js"></script>
    <title>Document</title>
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
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-light" type="submit">Search</button>
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
            <div class="abajo">
                <ul class="float-start uldos alinear lista">
                    <br>
                    <li>
                        <c:if test="${userActual.id == user.id}">
                            <a href="/profile/${user.id}/edit" class="btn btn-outline-light sombraclara">Editar perfil</a>
                        </c:if>
                    </li><br>
                    <li>
                        <c:if test="${userActual.id == user.id}">
                            <a href="/song/new" class="btn btn-outline-light sombraclara">Añadir cancion</a>
                        </c:if>
                    </li><br>
                    <li>
                        <a href="/wishlist/${userActual.id}" class="btn btn-outline-light sombraclara">Wishlist</a>
                    </li>
                </ul>

                <c:if test="${respectTotal >= 0 && respectTotal <=5}"><img src="/ranges/1.png" alt="" width="280" height="300"></c:if>
                <c:if test="${respectTotal > 5 && respectTotal <=10}"><img src="/ranges/2.png" alt="" width="280" height="300"></c:if>
                <c:if test="${respectTotal > 10 && respectTotal <=15}"><img src="/ranges/3.png" alt="" width="280" height="300"></c:if>
                <c:if test="${respectTotal > 15 && respectTotal <= 20}"><img src="/ranges/4.png" alt="" width="280" height="300"></c:if>
                <c:if test="${respectTotal > 20 && respectTotal <= 25}"><img src="/ranges/5.png" alt="" width="280" height="300"></c:if>
                <c:if test="${respectTotal > 25}"><img src="/ranges/6.png" alt="" width="280" height="300"></c:if> 
                <div class="alinear">
                    <h2>Nombre: <c:out value="${user.firstName}"></c:out></h2>
                    <h2>Apellido: <c:out value="${user.lastName}"></c:out></h2>
                    <h2>Region: <c:out value="${user.region}"></c:out></h2>
                    <h2>Respeto: <c:out value="${respectTotal}"></c:out></h2>
                </div>
            </div>
            <div class="tabla">
                <h4>Tus Canciones</h4>
                <table class="table table-striped table-hover table-dark table-responsive sombraclara">
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
                                <c:if test="${!lb.usersLike.contains(userActual)}"><a href="/like/${lb.id}?ruta=profile" class="btn btn-outline-info">Like</a></c:if>
                                <c:if test="${lb.usersLike.contains(userActual)}"><a href="/dislike/${lb.id}?ruta=profile" class="btn btn-outline-danger">Dislike</a></c:if>
                            </td>
                            <td>
                                <c:if test="${userActual.id != lb.uCreador.id && !lb.wishlistuser.contains(userActual)}"><a href="/addwishlist/${lb.id}?ruta=profile" class="btn btn-outline-light" >Add lo wish list</a></c:if>
                                <c:if test="${userActual.id != lb.uCreador.id && lb.wishlistuser.contains(userActual)}"><a href="/removewishlist/${lb.id}?ruta=profile" class="btn btn-outline-light">Remove from wish list</a></c:if>
                            </td>
                            <td><a href="/profile/${user.id}/${lb.id}" class="btn btn-outline-light" >comentarios</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div>
                <div class="alinear addcomentario">
                    <h4>Add comment:</h4>
                    <form>
                        <p>
                            <label path="comment"></label>
                            <errors path="comment"/>
                            <textarea path="comment" name="content" cols="30" rows="1" class="bg-dark letra"></textarea>
                        </p>
                        <input type="submit" value="Submit" class="btn btn-outline-light"/>
                    </form>
                </div>
                <div class="alinear float-end text-end">
                    <h1>Message Wall</h1>
                    <p>
                        <textarea readonly rows="8" cols="70" class="bg-dark letra"><c:out value="${data}"/></textarea>
                    </p>
                </div>
            </div>
        </main>
    </div>
</body>
</html>