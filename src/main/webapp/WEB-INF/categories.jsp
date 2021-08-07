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
	<link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link rel="shortcut icon" href="/css/BTLogo.png" type="image/x-icon">
    <title><c:out value="${category.genero}"/></title>
    <link rel="stylesheet" href="/css/scrollbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
    <div>
        <h1><c:out value="${category.genero}"/></h1>
        <table>
        <thead>
            <tr>
                <th>Author</th>
                <th>Title</th>
                <th>Price</th>
                <th>Reproductor</th>
                <th>Respect</th>
                <th>Wish List</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${category.beats}" var="g">
                <tr>
                    <td><a href="/profile/${g.uCreador.id}"><c:out value="${g.uCreador.firstName}"/></a></td>
                    <td><c:out value="${g.title}"/></td>
                    <td><c:out value="${g.cost}"/></td>
                    <td>
                        <audio controls src="${g.url}" class="btn btn-dark">
                            Your browser does not support the audio element.
                        </audio>
                    </td>
                    <td>
                        <c:out value="${g.usersLike.size()}"/>
                        <c:if test="${!g.usersLike.contains(userActual)}"><a href="/like/${g.id}?ruta=category" class="btn btn-outline-info">Like</a></c:if>
                        <c:if test="${g.usersLike.contains(userActual)}"><a href="/dislike/${g.id}?ruta=category" class="btn btn-outline-danger">Dislike</a></c:if>
                    </td>
                    <td>
                        <c:if test="${userActual.id != g.uCreador.id && !g.wishlistuser.contains(userActual)}"><a href="/addwishlist/${g.id}?ruta=category" class="btn btn-outline-dark">Add lo wish list</a></c:if>
                        <c:if test="${userActual.id != g.uCreador.id && g.wishlistuser.contains(userActual)}"><a href="/removewishlist/${g.id}?ruta=category" class="btn btn-outline-dark">Remove from wish list</a></c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
        </table>
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