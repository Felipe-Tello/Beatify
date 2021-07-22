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
    <h1>Añadir Cancion</h1>
    <form action="" enctype="multipart/form-data" method="POST">
        <input type="file" name="file">
        <form:form method="POST" action="" modelAttribute="modelBeat">
            <p>
                <form:label path="title">Titulo de la cancion</form:label>
                <form:input path="title"/>
            </p>
            <p>
                <form:label path="cost">Precio</form:label>
                <form:input path="cost"/>
            </p>
            <input class="btn btn-primary moveButton" type="submit" value="Register!"/>
        </form:form>
    </form>
</body>
</html>