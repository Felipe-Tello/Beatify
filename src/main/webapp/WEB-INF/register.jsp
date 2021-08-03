<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="/css/generalLG.css">
    <link rel="stylesheet" type="text/css" href="/css/register.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <title>Registro</title>
</head>
<body>
    <div class="container-fluid">
        <img id="iconoSup" src="/css/5 sin título_20210721162542.png">
        <div id="formulario">
            <h1 class="text-center">Regístrate</h1>
            <form:form method="POST" action="" modelAttribute="user">
                <div class="form-group">
                    <form:label path="firstName">Nombre</form:label>
                    <form:input class="form-control" placeholder="Ingresa tu nombre" path="firstName"/>
                    <small class="error"><form:errors  path="firstName"/></small>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Apellido</form:label>
                    <form:input class="form-control" placeholder="Ingresa tu apellido" path="lastName"/>
                    <small class="error"><form:errors  path="lastName"/></small>
                </div>
                <div class="form-group">
                    <form:label path="location">Ciudad</form:label>
                    <form:input class="form-control" placeholder="Ciudad" path="location"/>
                    <small class="error"><form:errors  path="location"/></small>
                <div>
                <div class="form-group">
                    <form:label for="exampleFormControlSelect1" path="region">Región</form:label>
                    <form:select class="form-select" path="region"> 
                        <option disabled selected>Selecciona tu región</option>
                        <form:option value="Tarapacá">Tarapacá (I)</form:option>
                        <form:option value="Antofagasta">Antofagasta (II)</form:option>
                        <form:option value="Atacama">Antacama (III)</form:option>
                        <form:option value="Coquimbo">Coquimbo (IV)</form:option>
                        <form:option value="Valparaíso">Valparaíso (V)</form:option>
                        <form:option value="O'Higgins">O'Higgins (VI)</form:option>
                        <form:option value="Maule">Maule (VII)</form:option>
                        <form:option value="BioBío">BioBío (VIII)</form:option>
                        <form:option value="La Araucanía">La Araucanía (IX)</form:option>
                        <form:option value="Los Lagos">Los Lagos (X)</form:option>
                        <form:option value="Aysén">Aysén (XI)</form:option>
                        <form:option value="Magallanes Y Antártica Chilena">Magallanes Y Antártica Chilena (XII)</form:option>
                        <form:option value="RM">Región Metropolitana de Santiago (XIII)</form:option>
                        <form:option value="Los Ríos">Los Ríos (XIV)</form:option>
                        <form:option value="Arica y Parinacota">Arica y Parinacota (XV)</form:option>
                        <form:option value="Ñuble">Ñuble (XVI)</form:option>
                    </form:select>
                    <small class="error"><form:errors  path="region"/></small>
                </div>
                    <div class="form-group mb-2">
                        <form:label for="staticEmail2" class="sr-only" path="email">Email</form:label>
                        <form:input class="form-control" placeholder="Ingresa tu email" type="email" path="email"/>
                        <small class="error"><form:errors  path="email"/></small>
                    </div>
                    <div class="form-group mb-2">
                        <form:label path="password">Contraseña</form:label>
                        <form:input placeholder="Ingresa tu contraseña" type = "password" class="form-control" path="password"/>
                        <small class="error"><form:errors  path="password"/></small>
                    </div>
                    <div class="form-group mb-2">
                        <form:label path="passwordConfirmation">Confirmar contraseña</form:label>
                        <form:input placeholder="Confirma tu contraseña" type = "password" class="form-control" path="passwordConfirmation"/>
                        <small class="error"><form:errors  path="passwordConfirmation"/></small>
                    </div>
                    <input class="btn btn-light w-100" type="submit" value="Registrar"/>
                </form:form>
                <div>
                    <h6 class="text-center">¿Ya tienes una cuenta? <a href="/login">Inicia sesión</a></h6>
                </div>
        </div>
    </div>
</body>
</html>