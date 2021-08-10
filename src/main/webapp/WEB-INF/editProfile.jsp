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
    <link rel="stylesheet" href="/css/scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link rel="stylesheet" href="/css/editProfile.css">
    <link rel="shortcut icon" href="/css/images/BTLogo.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>Editar perfil</title>
</head>
<body id="fondo">
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
                    
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Canción/Artista" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>

                </div>
            </div>
        </div>
    </nav>


    <div id="bajartabla" class="container-fluid">
        <div id="tablaEdit">
            <h1>Editar perfil</h1>

            <form:form method="POST" action="" modelAttribute="user">
        
                <input type="hidden" name="_method" value="put">
        
                <div class="form-group">
                    <form:label path="firstName">Nombre</form:label>
                    <form:input class="form-control" placeholder="Nombre" path="firstName"/>
                    <small class="text-danger"><form:errors path="firstName"/></small>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Apellido</form:label>
                    <form:input class="form-control" placeholder="Apellido" path="lastName"/>
                    <small class="text-danger"><form:errors path="lastName"/></small>
                </div>

                <div class="form-group">
                    <form:label path="region">Ciudad</form:label>
                    <form:input class="form-control" placeholder="Ciudad/Comuna" path="location"/>
                    <small class="text-danger"><form:errors path="location"/></small>
                </div>

                <div class="form-group">
                    <!-- cambiar a una lista dsps -->
                    <form:label path="region">Región</form:label>
                    <form:select class="form-select" path="region"> 
                        <form:option value="Tarapacá">Tarapacá (I)</form:option>
                        <form:option value="Antofagasta">Antofagasta (II)</form:option>
                        <form:option value="Atacama">Antacama (III)</form:option>
                        <form:option value="Coquimbo">Coquimbo (IV)</form:option>
                        <form:option value="Valparaíso">Valparaíso (V)</form:option>
                        <form:option value="O'Higgins">O'Higgins (VI)</form:option>
                        <form:option value="Maule">Maule (VII)</form:option>
                        <form:option value="BioBío">BioBío (VIII)</form:option>
                        <form:option value="La Araucanía">La Araucanía (IX)</form:option>
                        <form:option value="Los Lagos">Los Lagos (X)</form:option>
                        <form:option value="Aysén">Aysén (XI)</form:option>
                        <form:option value="Magallanes Y Antártica Chilena">Magallanes Y Antártica Chilena (XII)</form:option>
                        <form:option value="RM">Región Metropolitana de Santiago (XIII)</form:option>
                        <form:option value="Los Ríos">Los Ríos (XIV)</form:option>
                        <form:option value="Arica y Parinacota">Arica y Parinacota (XV)</form:option>
                        <form:option value="Ñuble">Ñuble (XVI)</form:option>
                    </form:select>
                    <small class="text-danger"><form:errors path="region"/></small>
                </div>

                <div class="form-group">
                    <form:label path="descripcion">Descripción</form:label>
                    <form:textarea class="form-control" placeholder="Añadir descripción (opcional)" path="descripcion"/>
                    <small class="text-danger"><form:errors path="descripcion"/></small>
                </div>
                
                <form:input class="form-control" type="hidden" path= "email" value = "${user.email}"/>
                <form:input type = "hidden" class="form-control" path="password" value = "${user.password}"/>
                <form:input type = "hidden" class="form-control" path="passwordConfirmation" value = "${user.passwordConfirmation}"/>

                <div class="form-group botonesNav">
                    <a href="/profile/${userActual.id}" class="btn btn-outline-info opacity-75 botonVolver" >Volver atrás</a>
                    <input class="btn btn-outline-light w-50" type="submit" value="Confirmar"/>
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