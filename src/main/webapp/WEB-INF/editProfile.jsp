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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Editar perfil</title>
</head>
<body>

    <div class="container">
        <p class="text-right">
            <a href="/dashboard">Menú</a>
        </p>
        <h1>Editar perfil</h1>

        <form:form method="POST" action="" modelAttribute="user">
    
            <input type="hidden" name="_method" value="put">
    
            <div class="form-group">
                <form:label path="firstName">Nombre:</form:label>
                <form:input class="form-control" placeholder="Nombre" path="firstName"/>
                <small class="text-danger"><form:errors path="firstName"/></small>
            </div>
            <div class="form-group">
                <form:label path="lastName">Apellido:</form:label>
                <form:input class="form-control" placeholder="Apellido" path="lastName"/>
                <small class="text-danger"><form:errors path="lastName"/></small>
            </div>

            <div class="form-group">
                <form:label path="region">Ciudad/Comuna:</form:label>
                <form:input class="form-control" placeholder="Ciudad/Comuna" path="location"/>
                <small class="text-danger"><form:errors path="location"/></small>
            </div>

            <div class="form-group">
                <!-- cambiar a una lista dsps -->
                <form:label for="exampleFormControlSelect1" path="region">Región</form:label>
                <form:select class="form-select" path="region"> 
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
                <small class="text-danger"><form:errors path="region"/></small>
            </div>

            <div class="form-group mb-2">
                <form:label for="staticEmail2" class="sr-only" path="descripcion">Descripción:</form:label>
                <form:textarea class="form-control" placeholder="Añadir descripción (opcional)" path="descripcion"/>
            </div>
                <div class="form-group mb-2">
                    <form:input class="form-control" type="hidden" path= "email" value = "${user.email}"/>
                </div>
                <div>
                    <form:input type = "hidden" class="form-control" path="password" value = "${user.password}"/>
                </div>
                <div>
                    <form:input type = "hidden" class="form-control" path="passwordConfirmation" value = "${user.passwordConfirmation}"/>
                </div>
            <input id="botonRegis" class="btn btn-light" type="submit" value="Editar"/>
        </form:form>
        <a href="/profile/${userId}">Volver atrás</a>
    </div>
</body>
</html>