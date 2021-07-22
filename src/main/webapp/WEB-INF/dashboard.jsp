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
    <a href="/logout">Cerrar Sesion</a>
    <br>
    <a href="/profile/${Usuario.id}">ir al perfil</a>
    <h1>Welcome <c:out value="${Usuario.firstName}"></c:out></h1>
    <table>
        <thead>
            <tr>
                <th>Autor</th>
                <th>Price</th>
                <th>Template</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaBeats}" var="lb">
            <tr>
                <td><c:out value="${lb.title}"/></td>
                <td><c:out value="${lb.cost}"/></td>
                <td>
                    <audio controls>
                        <source src="${lb.url}" type="audio/ogg">
                        <source src="${lb.url}" type="audio/mpeg">
                        Your browser does not support the audio element.
                    </audio>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>