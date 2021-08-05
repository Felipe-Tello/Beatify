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
    <title>Beatify</title>
    <link rel="stylesheet" type="text/css" href="/css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
	<link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link rel="stylesheet" href="/css/scrollbar.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/comentarios.js"></script>
</head>
<body id="contenedor">
	<!-- BARRA NAV -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
                    
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Canción/Artista" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </div>
    </nav>




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

		<h3>Canciones de artistas cercanos a <c:out value="${userActual.region}"></c:out></h3>

		<c:forEach items="${listaCategories}" var="lc"> 
			<a href="/categories/${lc.id}"><c:out value="${lc.genero}"/></a>
		</c:forEach>
		<div id="tabla">
			<table class="table table-dark table-sm table-responsive mb-5">
				<thead>
					<tr>
						<th scope="col">Autor</th>
						<th scope="col">Titulo</th>
						<th scope="col">Price</th>
						<th scope="col">Reproductor</th>
						<th scope="col">Respect</th>
						<th scope="col">Wish List</th>
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
  	<footer>
        <main role="main" class="container">
            <img class="logofooter espacio float-start" src="/css/logoblancoynegro.png" alt="">
            <div class="espacio letra alinear">
                <h6>SERVIVIO AL CLIENTE</h6>
                <ul>
                    <li>Acerca de</li>
                    <li>Terminos y Condiciones</li>
                    <li>Privacidad y Seguridad</li>
                    <li>Representante Legal</li>
                    <li>Orden de Servicio</li>
                    <li>Bases y Promociones</li>
                </ul>
            </div>
            <div class="espacio letra alinear">
                <h6>COMUNIDAD</h6>
                <ul>
                    <li>Servicio para Artistas</li>
                    <li>Publicidad</li>
                    <li>Proveedores</li>
                    <li>Inversionistas</li>
                </ul>
            </div>
            <div class="espacio letra redes text-center float-end">
                <h6>Siguenos en:</h6>
                <img class="logoredes imagen" src="/css/facebook.png" alt="">
                <img class="logoredes imagen" src="/css/twitter.png" alt="">
                <img class="logoredes imagen" src="/css/youtube.png" alt="">
                <img class="logoredes imagen" src="/css/discord.png" alt="">
                <h6>CONTACTANOS</h6>
                <h6>Beatify@gmail.com</h6>
            </div>
            <div class="text-center espacio letra">
                <p>Chile 2021 Beatify</p>
                <p>Legal / Centro de Privacidad / Politica de privacidad / Cookies</p>
            </div>
        </main>
    </footer>
</body>
</html>