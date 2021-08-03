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
    <link rel="stylesheet" type="text/css" href="/css/search.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <div id="contenedor">
        <nav class="navbar navbar-expand-md fixed-top barra bg-dark">
            <img id="icono" src="/css/5 sin título_20210721162541.png">
            <div class="container-fluid">
                <ul class="nav-menu">
                    <li class="alinear">
                		<a href="/profile/${userActual.id}" class="btn btn-outline-light">ir al perfil</a>
            		</li>
                    <li class="alinear">
                        <a href="/dashboard" class="btn btn-outline-light">volver al menu principal</a>
                    </li>
                    <li class="alinear">
                        <!-- <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-light" type="submit">Search</button>
                        </form> -->
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
        <main role="main" class="container contenedordos tabla">
            <div class="abajo">
                <table class="table table-dark table-sm table-responsive sombra" >
                    <thead>
                        <tr>
                            <th>Autor</th>
                            <th>Titulo</th>
                            <th>Price</th>
                            <th>Reproductor</th>
                            <th>Wish List</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${searchword}" var="lb">
                        <tr>
                            <td><c:out value="${lb.uCreador.firstName}"/></td>
                            <td><c:out value="${lb.title}"/></td>
                            <td>$ <c:out value="${lb.cost}" /></td>
                            <td>
                                <audio controls src="${lb.url}"  class="btn btn-dark">
                                    Your browser does not support the audio element.
                                </audio>
                            </td>
                            <td><a href="/removewishlist/${lb.id}?ruta=wishlist" class="btn btn-outline-light">Remove from wish list</a></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>