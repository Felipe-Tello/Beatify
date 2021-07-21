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
        <p class="error"><c:out value="${error}"/></p>
        <form method="post" action="/login">
            <p>
                <label for="email">Email</label>
                <input type="text" id="email" name="email"/>
            </p>
            <p>
                <label for="password">Password</label>
                <input type="password" id="password" name="password"/>
            </p>
            <input class="btn btn-primary moveButton" type="submit" value="Login!"/>
        </form>
    </div>
</body>
</html>