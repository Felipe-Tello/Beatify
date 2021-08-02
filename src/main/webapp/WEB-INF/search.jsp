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
</head>
<body>
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
            <c:forEach items="${searchword}" var="lb">
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
</body>
</html>