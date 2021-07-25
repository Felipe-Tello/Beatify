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
        <h1>Login</h1>
        <c:if test="${error != null}">
            <p>
                <c:out value = "${error}">
            </p>
        </c:if>
        <form method="post" action="/login">

            <p>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email"/>
            </p>

            <p>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password"/>
            </p>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input class="btn btn-primary moveButton" type="submit" value="Login!"/>
        </form>
        <p>¿Aún no tienes una cuenta? 
            <a href="/register">Regístrate</a>
        </p>
    </div>
</body>
</html>