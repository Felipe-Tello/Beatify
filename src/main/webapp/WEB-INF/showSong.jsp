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
    <link rel="stylesheet" type="text/css" href="/css/showSong.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link rel="stylesheet" href="/css/scrollbar.css">
    <link rel="shortcut icon" href="/css/BTLogo.png" type="image/x-icon">
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
		                <c:if test="${permiso == true}">
		                    <a href="/admin" class="btn btn-outline-light">Página de administrador</a>
		                </c:if>
		            </li>
                    <li class="alinear">
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
        <main role="main" class="container contenedordos">
            <div  class="abajo">
                <ul class="float-start uldos alinear lista">
                    <li>
                        <p class="text-right">
                            <a href="/dashboard" class="btn btn-outline-light sombra">Menú</a>
                        </p>
                    </li>
                    <li>
                        <c:if test="${usuario.id == beat.uCreador.id}">
                            <a href="/song/${beat.id}/edit" class="btn btn-outline-light sombra">Editar</a>
                        </c:if>
                    </li>
                </ul>
                <a href="/dashboard" class="btn btn-outline-light alinear float-end">Volver atrás</a>
                <div class="alinear titulo">
                    <h1>Titulo: <c:out value="${beat.title}"></c:out></h1>
                    <h1>Author: <c:out value="${beat.uCreador.firstName}"></c:out></h1>
                    <h1>cost: <c:out value="${beat.cost}"></c:out></h1>
                </div>
                <div class="audio sombra bg-dark float-center">
                    <audio controls>
                        <source src="${beat.url}" type="audio/ogg">
                        <source src="${beat.url}" type="audio/mpeg">
                        Your browser does not support the audio element.
                    </audio>
                </div>
                <div>
                    <div class="alinear addcomentario">
                        <h4>Add comment:</h4>
                        <form:form action="" method="post" modelAttribute="messageModel">
                            <p>
                                <form:label path="comment"></form:label>
                                <form:errors path="comment"/>
                                <form:textarea path="comment" name="content" cols="20" rows="1" class="bg-dark letra"></form:textarea>
                            </p>
                            <input type="submit" value="Submit" class="btn btn-outline-light"/>
                        </form:form>
                    </div>
                    <div class="float-center text-center">
                        <h1>Message Wall</h1>
                        <p>
                            <textarea readonly rows="8" cols="70" class="bg-dark letra"><c:out value="${data}"/></textarea>
                        </p>
                    </div>
                </div>
            </div>
        </main>
    </div>


    <footer>
        <main role="main" class="container">

			<div class="row">
				<div id="small" class="col-md-3 col-lg-2">
					<img id="logofooter" class="espacio" src="/css/logoblancoynegro.png" alt="logoFooter">
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
					<img class="logoredes imagen" src="/css/facebook.png" alt="">
					<img class="logoredes imagen" src="/css/twitter.png" alt="">
					<img class="logoredes imagen" src="/css/youtube.png" alt="">
					<img class="logoredes imagen" src="/css/discord.png" alt="">
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