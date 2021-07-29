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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Registro</title>
</head>
<body>
    <div class="container-fluid">
        <img id="iconoSup" src="/css/5 sin título_20210721162542.png">
        <div id="formulario">
            <h1>Registrar</h1>
            <form:form method="POST" action="" modelAttribute="user">
                <div class="form-group">
                    <form:label path="firstName">Nombre</form:label>
                    <form:input class="form-control" placeholder="Ingresa tu nombre" path="firstName"/>
                    <p class="error"><form:errors  path="firstName"/></p>
                </div>
                <div class="form-group">
                    <form:label path="lastName">Apellido</form:label>
                    <form:input class="form-control" placeholder="Ingresa tu apellido" path="lastName"/>
                    <p class="error"><form:errors  path="lastName"/></p>
                </div>
                <div class="form-group">
                    <form:label path="location">Ciudad</form:label>
                    <form:input class="form-control" placeholder="Location" path="location"/>
                    <p class="error"><form:errors  path="location"/></p>
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
                    <p class="error"><form:errors  path="region"/></p>
                </div>
                    <div class="form-group mb-2">
                        <form:label for="staticEmail2" class="sr-only" path="email">Email</form:label>
                        <form:input class="form-control" placeholder="Ingresa tu email" type="email" path="email"/>
                        <p class="error"><form:errors  path="email"/></p>
                    </div>
                    <div>
                        <form:label path="password">Contraseña</form:label>
                        <form:input placeholder="Ingresa tu contraseña" type = "password" class="form-control" path="password"/>
                        <p class="error"><form:errors  path="password"/></p>
                    </div>
                    <div>
                        <form:label path="passwordConfirmation">Confirmacion contraseña</form:label>
                        <form:input placeholder="Confirma tu contraseña" type = "password" class="form-control" path="passwordConfirmation"/>
                        <p class="error"><form:errors  path="passwordConfirmation"/></p>
                    </div>
                    <input class="btn btn-light w-100" type="submit" value="Registrar"/>
                </form:form>
                <div>
                    <h6>¿Ya tienes una cuenta? <a href="/login">Inicia sesión</a></h6>
                </div>
        </div>
    </div>
</body>
</html>