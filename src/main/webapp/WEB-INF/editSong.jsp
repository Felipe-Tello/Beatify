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
    <link rel="stylesheet" type="text/css" href="/css/addsong.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link rel="shortcut icon" href="/css/images/BTLogo.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link rel="stylesheet" type="text/css" href="/css/scrollbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Editar Canción</title>
</head>
<body id="contenedor">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container-fluid">
            <a href="/dashboard" class="navbar-brand"><img id="icono" src="/css/images/5 sin título_20210721162541.png" alt="dashboard"></a>

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
                    </ul>
                    
                    <form action="/search" class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Beats, artista, región" aria-label="Search" name="busqueda">
                        <button class="btn btn-outline-success" type="submit" value="Search">Buscar</button>
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="contenedorMonitosEditar end-0">
            <img src="/css/images/16 sin título_20210723201644.png" id="imgMonitos" alt="monitosFondo">
        </div>
        <div id="agregar" class="tamañoXSSM col-md-7 col-lg-5 col-xl-4 sombra">
            <h2 class="text-center text-white">Editar Beat</h2>

            <c:if test="${error != null}">
                <small class="text-danger"><c:out value = "${error}"/></small>
            </c:if>

            <form:form method="POST" action="" modelAttribute="beat">

                <input type="hidden" name="_method" value="put">

                <div class="">
                    <form:label path="title">Título <span class="text-danger">*</span></form:label>
                    <form:input class="form-control" path="title" placeholder="Título del beat"/>
                    <small class="text-danger"><form:errors path="title"/></small>
                </div>
                <div class="form-group">
                    <form:label path="cost">Precio (CLP) <span class="text-danger">*</span></form:label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <form:input type="number" class="form-control" path="cost" step="100" min="0"/>
                    </div>
                    <small class="text-danger d-block"><form:errors path="cost"/></small>
                </div>
                <div class="form-group">
                    <form:label path="categories" class="d-block">Añadir Categorías <span class="text-danger">*</span>. Si desea mantener las actuales, debe seleccionarlas. </form:label>

                    <small class="d-block letraGris">Actuales: 
                        <c:forEach items="${beatCategories}" var="lc">
                            <c:out value="${lc.genero} "/>
                        </c:forEach>
                    </small>

                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle w-100" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            Selecciona categorías
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark w-100" aria-labelledby="dropdownMenuButton1" id="letrasGenero">
                            <c:forEach items="${listaCategories}" var="lc">
                                <li class="dropdown-item">
                                    <form:checkbox path="categories" value="${lc.id}"/>
                                    <c:out value="${lc.genero}"/>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="botonesNav mt-3">
                    <a href="/song/${idBeat}" class="btn btn-outline-info opacity-75 boton">Volver atrás</a>
                    <input type="submit" class="btn btn-outline-light w-50 subir" value="Editar"/>
                </div>
            </form:form>
        </div>
    </div>

    <footer>
        <main role="main" class="container">

			<div class="row">
				<div id="small" class="col-md-3 col-lg-2">
					<img id="logofooter" class="espacio" src="/css/images/logoblancoynegro.png" alt="logoFooter">
				</div>
				<div class="espacio letra col-md-4 col-lg-3">
					<h6>SERVICIO AL CLIENTE</h6>
					<ul class="lista">
						<li>Acerca de</li>
						<li>Términos y Condiciones</li>
						<li>Privacidad y Seguridad</li>
						<li>Representante Legal</li>
						<li>Orden de Servicio</li>
						<li>Bases y Promociones</li>
					</ul>
				</div>
				<div class="espacio letra col-md-4 col-lg-3">
					<h6>COMUNIDAD</h6>
					<ul class="lista">
						<li>Servicio para Artistas</li>
						<li>Publicidad</li>
						<li>Proveedores</li>
						<li>Inversionistas</li>
					</ul>
				</div>
				<div class="espacio letra redes text-center col-lg-4">
					<h6>Síguenos en:</h6>

					<img class="logoredes imagen" src="/css/images/facebook.png" alt="logoFacebook">
					<img class="logoredes imagen" src="/css/images/twitter.png" alt="logoTwitter">
					<img class="logoredes imagen" src="/css/images/youtube.png" alt="logoYoutube">
					<img class="logoredes imagen" src="/css/images/discord.png" alt="logoDiscord">

					<h6>CONTÁCTANOS</h6>
					<h6>Beatify@gmail.com</h6>
				</div>
				<div class="text-center espacio letra">
					<p>© Chile 2021 Beatify</p>
					<p>Legal / Centro de Privacidad / Política de privacidad / Cookies</p>
				</div>

			</div>
           
        </main>
    </footer>
</body>
</html>