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

    <!-- input readonly buscar -->
    <h1>Editar perfil, <c:out value = "${user.firstName} ${user.lastName}" /></h1>

    <form:form method="POST" action="" modelAttribute="user">

        <input type="hidden" name="_method" value="put">

        <div class="form-group">
            <form:label path="firstName">Nombre:</form:label>
            <form:input class="form-control" placeholder="Nombre" path="firstName"/>
        </div>
        <div class="form-group">
            <form:label path="lastName">Apellido:</form:label>
            <form:input class="form-control" placeholder="Apellido" path="lastName"/>
        </div>
        <div class="form-group">
            <form:label path="region">Ciudad/Comuna:</form:label>
            <form:input class="form-control" placeholder="Ciudad/Comuna" path="location"/>

            <!-- cambiar a una lista dsps -->
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
        <div class="form-group mb-2">
            <form:label for="staticEmail2" class="sr-only" path="descripcion">Descripción:</form:label>
            <!-- agregar un width -->
            <form:textarea class="form-control" placeholder="Añadir descripción (opcional)" path="descripcion"/>
        </div>
        <!-- <div class="form-group mb-2">
            <form:input class="form-control" type="hidden" path= "email" value = "${user.email}"/>
        </div>
        <div>
            <form:input type = "hidden" class="form-control" path="password" value = "${user.password}"/>
        </div>
        <div>
            <form:input type = "hidden" class="form-control" path="passwordConfirmation" value = "${user.passwordConfirmation}"/>
        </div> -->
        <input id="botonRegis" class="btn btn-light" type="submit" value="Editar"/>
    </form:form>
</body>
</html>