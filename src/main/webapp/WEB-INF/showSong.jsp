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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
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
</body>
</html>