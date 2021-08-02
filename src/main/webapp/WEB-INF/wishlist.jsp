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
    <link rel="stylesheet" type="text/css" href="/css/wishlist.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    <div id="contenedor">
        <div class="abajo">
	        <h1>Wish list</h1>
	        <div id="tabla">
	            <table class="table table-dark table-sm table-responsive" >
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
	                    <c:forEach items="${wishlist}" var="lb">
	                    <tr>
	                        <td><c:out value="${lb.uCreador.firstName}"/></td>
	                        <td><c:out value="${lb.title}"/></td>
	                        <td>$ <c:out value="${lb.cost}"/></td>
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
	          <a href="/realizarcompra">realizar compra</a>
	        <div>
        </div>
    </div>
</body>
</html>