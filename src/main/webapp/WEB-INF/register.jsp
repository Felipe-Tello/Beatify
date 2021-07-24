<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/css/register.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    <div id="contenedor">
        <img id="iconoSup" src="/css/5 sin título_20210721162542.png">
        <div id="formulario">
            <h1>Register</h1>
            <p class="error"><form:errors  path="user.*"/></p>
            <form:form method="POST" action="" modelAttribute="user">
                <div class="form-group">
                    <form:label path="firstName">First Name</form:label>
                    <form:input class="form-control" placeholder="First Name" path="firstName"/>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Last Name</form:label>
                    <form:input class="form-control" placeholder="Last Name" path="lastName"/>
                </div>
                <div class="form-group">
                    <form:label path="region">Location</form:label>
                    <form:input class="form-control" placeholder="Location" path="location"/>
                    <form:label for="exampleFormControlSelect1" path="region">Región</form:label>
                    <form:select class="form-control" id="exampleFormControlSelect1" path="region"> 
                        <form:option value="Arica y Parinacota">Arica y Parinacota</form:option>
                        <form:option value="Tarapacá">Tarapacá</form:option>
                        <form:option value="Antofagasta">Antofagasta</form:option>
                        <form:option value="Coquimbo">Coquimbo</form:option>
                        <form:option value="Valparaíso">Valparaíso</form:option>
                        <form:option value="O'Higgins">O'Higgins</form:option>
                        <form:option value="Maule">Maule</form:option>
                        <form:option value="Ñuble">Ñuble</form:option>
                        <form:option value="BioBío">BioBío</form:option>
                        <form:option value="La Araucanía">La Araucanía</form:option>
                        <form:option value="Los Ríos">Los Ríos</form:option>
                        <form:option value="Los Lagos">Los Lagos</form:option>
                        <form:option value="Aysén">Aysén</form:option>
                        <form:option value="Magallanes Y Antártica Chilena">Magallanes Y Antártica Chilena</form:option>
                        <form:option value="RM">RM</form:option>
                    </form:select>
                </div>
                <form class="form-inline">
                    <div class="form-group mb-2">
                        <form:label for="staticEmail2" class="sr-only" path="email">Email:</form:label>
                        <form:input class="form-control" placeholder="Email" type="email" path="email"/>
                    </div>
                    <div>
                        <form:label path="password">Password:</form:label>
                        <form:input placeholder="Password" type = "password" class="form-control" path="password"/>
                    </div>
                    <div>
                        <form:label path="passwordConfirmation">Password confirmation:</form:label>
                        <form:input placeholder="Password confirmation" type = "password" class="form-control" path="passwordConfirmation"/>
                    </div>
                    <input id="botonRegis"  class="btn btn-light" type="submit" value="Register!"/>
                </form:form>
                <div>
                    <h6>¿Ya tienes una cuenta? <a href="/login">Inicia sesión</a></h6>
                </div>
        </div>
    </div>
</body>
</html>