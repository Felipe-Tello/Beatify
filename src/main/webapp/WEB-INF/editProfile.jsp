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
    <link rel="stylesheet" href="/css/editProfile.css">
    <link rel="shortcut icon" href="/css/images/BTLogo.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>Editar perfil</title>
</head>
<body>
    <nav class="navbar navbar-expand-md fixed-top barra bg-dark">
        <a href="/dashboard"><img id="icono" src="/css/5 sin título_20210721162541.png" alt="dashboard"></a>
        <div class="container-fluid">
            <ul class="nav-menu">
                <li class="alinear">
                    <a id="botonbarra" class="btn btn-outline-light" href="/profile/${userId}">Volver atrás</a>
                </li>
                <li class="alinear">
                    <a id="botonbarra" class="btn btn-outline-light" href="/dashboard">Menú</a>
                </li>
            </ul>
        </div>
    </nav>
    <div id="bajartabla">
        <div id="tablaEdit">
            <h1>Editar perfil</h1>

            <form:form method="POST" action="" modelAttribute="user">
        
                <input type="hidden" name="_method" value="put">
        
                <div class="form-group">
                    <form:label path="firstName">Nombre:</form:label>
                    <form:input class="form-control" placeholder="Nombre" path="firstName"/>
                    <small class="text-danger"><form:errors path="firstName"/></small>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Apellido:</form:label>
                    <form:input class="form-control" placeholder="Apellido" path="lastName"/>
                    <small class="text-danger"><form:errors path="lastName"/></small>
                </div>

                <div class="form-group">
                    <form:label path="region">Ciudad/Comuna:</form:label>
                    <form:input class="form-control" placeholder="Ciudad/Comuna" path="location"/>
                    <small class="text-danger"><form:errors path="location"/></small>
                </div>

                <div class="form-group">
                    <!-- cambiar a una lista dsps -->
                    <form:label for="exampleFormControlSelect1" path="region">Región</form:label>
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

                    <div class="form-group mb-2">
                        <form:label for="staticEmail2" class="sr-only" path="descripcion">Descripción:</form:label>
                        <form:textarea class="form-control" placeholder="Añadir descripción (opcional)" path="descripcion"/>
                        <small class="text-danger"><form:errors path="descripcion"/></small>
                    </div>
                    <div class="form-group mb-2">
                        <form:input class="form-control" type="hidden" path= "email" value = "${user.email}"/>
                    </div>
                    <div>
                        <form:input type = "hidden" class="form-control" path="password" value = "${user.password}"/>
                    </div>
                    <div>
                        <form:input type = "hidden" class="form-control" path="passwordConfirmation" value = "${user.passwordConfirmation}"/>
                    </div>
                <input id="botonRegis" class="btn btn-light w-100" type="submit" value="Confirmar edición"/>
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