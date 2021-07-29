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
    <form method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Cerrar sesión" />
    </form>
    <p class="text-right">
        <a href="/dashboard">Menú</a>
    </p>
    <h1>Titulo: <c:out value="${beat.title}"></c:out></h1>
    <h1>Author: <c:out value="${beat.uCreador.firstName}"></c:out></h1>
    <h1>cost: <c:out value="${beat.cost}"></c:out></h1>
    <c:if test="${usuario.id == beat.uCreador.id}">
        <p>
            <a href="/song/${beat.id}/edit">Editar</a>
        </p>
    </c:if>
    <audio controls>
        <source src="${beat.url}" type="audio/ogg">
        <source src="${beat.url}" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>

    <h1>Message Wall</h1>
        <p>
        <textarea readonly rows="10" cols="40"><c:out value="${data}"/></textarea>
        </p>
    <h4>Add comment:</h4>
    <form:form action="" method="post" modelAttribute="messageModel">
        <p>
            <form:label path="comment"></form:label>
            <form:errors path="comment"/>
            <form:textarea path="comment" name="content" cols="20" rows="1"></form:textarea>
        </p>
        <input type="submit" value="Submit"/>
    </form:form>
    <a href="/dashboard">Volver atrás</a>
</body>
</html>