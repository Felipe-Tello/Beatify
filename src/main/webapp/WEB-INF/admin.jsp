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
    <form:form method="POST" action="" modelAttribute="categoryModel">
        <div">
            <form:label path="genero">Genero Musical</form:label>
            <form:input class="form-control" placeholder="Genero Musical" path="genero"/>
        </div>
        <input id="botonRegis"  class="btn btn-light" type="submit" value="Register!"/>
    </form:form>
</body>
</html>