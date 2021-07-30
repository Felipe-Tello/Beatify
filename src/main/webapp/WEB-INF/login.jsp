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
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/generalLG.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Ingresar</title>
</head>
<body>
    <div class="container-fluid">
        <img class="iconoSup" src="/css/BTlogo.png" alt="">
        <div id="login">
            <h1 class="text-center">Ingresar</h1>
            <c:if test="${error != null}">
                <small class="error text-center">
                    <c:out value = "${error}"/>
                </small>
            </c:if>
            <form method="post" action="/login">

                <div class="form-group mb-2">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese su email"/>
                </div>

                <div class="form-group mb-2">
                    <label for="password">Contraseña:</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Ingrese su contraseña"/>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <input class="btn btn-light moveButton w-100" type="submit" value="Ingresar!"/>
            </form>

            <h6 class="text-center">¿Aún no tienes una cuenta? <a href="/register">Regístrate</a></h6>
        </div>
    </div>
</body>
</html>