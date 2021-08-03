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
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/comentarios.js"></script>
</head>
<body>
    <div id="contenedor">
   		<nav class="navbar navbar-expand-md fixed-top barra bg-dark">
            <img id="icono" src="/css/5 sin título_20210721162541.png">
            <div class="container-fluid">
                <ul class="nav-menu">
		           	<li class="alinear">
		                <c:if test="${permiso == true}">
		                    <a href="/admin" class="btn btn-outline-light">Página de administrador</a>
		                </c:if>
		            </li>
                  	<li class="alinear">
                		<a href="/profile/${userActual.id}" class="btn btn-outline-light">ir al perfil</a>
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
<<<<<<< HEAD
=======
	<!-- CAROUSEL -->
	<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
		<div class="carousel-inner">
		  <div class="carousel-item active" data-bs-interval="10000">
			<img src="/css/5 sin título_20210721162541.png" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			  <h5>First slide label</h5>
			  <p>Some representative placeholder content for the first slide.</p>
			</div>
		  </div>
		  <div class="carousel-item" data-bs-interval="2000">
			<img src="/css/5 sin título_20210721162541.png" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			  <h5>Second slide label</h5>
			  <p>Some representative placeholder content for the second slide.</p>
			</div>
		  </div>
		  <div class="carousel-item">
			<img src="/css/5 sin título_20210721162541.png" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			  <h5>Third slide label</h5>
			  <p>Some representative placeholder content for the third slide.</p>
			</div>
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	  </div>
    <!-- FORMULARIO PARA CERRAR SESIÓN -->
>>>>>>> 8791faa4dd0a7a045927b5e8ea97e3f2391d6f88
        <div class="abajo">

	        <c:if test="${errorSong != null}">
	            <p class="text-danger"><c:out value = "${errorSong}"/></p>
	        </c:if>

	        <c:if test="${errorUser != null}">
	            <p class="text-danger"><c:out value = "${errorUser}"/></p>
	        </c:if>

	        <h1>Welcome <c:out value="${userActual.firstName}"></c:out></h1>

			<form action="/search">
				<input type="search" name="busqueda">
				<input type="submit" value="Search">
			</form>

	        <a href="/wishlist/${userActual.id}" class="btn btn-outline-light float-end padd sombra">Wishlist</a>

	        <h3>Canciones de artistas cercanos a <c:out value="${userActual.region}"></c:out></h3>

	        <c:forEach items="${listaCategories}" var="lc"> 
	            <a href="/categories/${lc.id}"><c:out value="${lc.genero}"/></a>
	        </c:forEach>
<<<<<<< HEAD

	        <c:forEach items="${category.beats}" var="cb"> 
	            <c:out value="${cb.title}"/>
	        </c:forEach>

=======
>>>>>>> 8791faa4dd0a7a045927b5e8ea97e3f2391d6f88
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
	                    <tr id="#row">
	                        <td>
								<a href="/profile/${lb.uCreador.id}"><c:out value="${lb.uCreador.firstName}"/></a>
							</td>
	                        <td>
								<a href="/song/${lb.id}"><c:out value="${lb.title}"/></a>
							</td>
	                        <td>
								<c:out value="${lb.cost}"/>
							</td>
	                        <td>
	                            <audio controls src="${lb.url}" class="btn btn-dark">
	                                Your browser does not support the audio element.
	                            </audio>
	                        </td>
	                        <td id="${lb.id}">
								<span><c:out value = "${lb.usersLike.size()}"/></span>
	                            <c:if test="${!lb.usersLike.contains(userActual)}">
									<a href="#row"class="btn btn-outline-info" onclick="like(${lb.id}, 'like')">Like</a>
								</c:if>
	                            <c:if test="${lb.usersLike.contains(userActual)}">
									<a href="#row" onclick="like(${lb.id}, 'dislike')" class="btn btn-outline-danger" >Dislike</a>
								</c:if>
	                        </td>
	                        <td>
	                            <c:if test="${userActual.id != lb.uCreador.id && !lb.wishlistuser.contains(userActual)}">
									<a href="/addwishlist/${lb.id}?ruta=dashboard" class="btn btn-outline-light">Add lo wish list</a>
								</c:if>
	                            <c:if test="${userActual.id != lb.uCreador.id && lb.wishlistuser.contains(userActual)}">
									<a href="/removewishlist/${lb.id}?ruta=dashboard" class="btn btn-outline-light">Remove from wish list</a>
								</c:if>
	                        </td>
	                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
        </div>
    </div>
</body>
</html>