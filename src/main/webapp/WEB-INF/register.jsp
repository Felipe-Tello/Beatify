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
    <div>
        <h1>Register</h1>
        <p class="error"><form:errors  path="user.*"/></p>
        <form:form method="POST" action="/" modelAttribute="user">
            <p>
                <form:label path="firstName">First Name</form:label>
                <form:input path="firstName"/>
            </p>
            <p>
                <form:label path="lastName">Last Name</form:label>
                <form:input path="lastName"/>
            </p>
            <p>
	            <form:label path="region">Location</form:label>
	            <form:input path="region"/>
	            <form:select path="region"> 
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
	        </p>
            <p>
                <form:label path="email">Email:</form:label>
                <form:input type="email" path="email"/>
            </p>
            <p>
                <form:label path="password">Password:</form:label>
                <form:password path="password"/>
            </p>
            <p>
                <form:label path="passwordConfirmation">PW Conf:</form:label>
                <form:password path="passwordConfirmation"/>
            </p>
            <input class="btn btn-primary moveButton" type="submit" value="Register!"/>
        </form:form>
    </div>
</body>
</html>