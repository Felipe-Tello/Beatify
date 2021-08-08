<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/inicio.css">
    <link rel="stylesheet" type="text/css" href="/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/css/fotter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
    <body class="fondo" background="/css/images/instruments_microphones_studio_room_record-788410.jpg!d.jpg">
        
    <div id="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <a href="/dashboard" class="navbar-brand"><img id="icono" src="/css/images/5 sin título_20210721162541.png" alt="dashboard"></a>
    
                <button type="button" class="navbar-toggler" data-bs-toggle="offcanvas" data-bs-target="#menu" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
    
                <div class="offcanvas offcanvas-end bg-dark" tabindex="-1" id="menu" aria-labelledby="offcanvasNavbarLabel">
    
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title text-white" id="offcanvasNavbarLabel">Bienvenido, <c:out value="${userActual.firstName}"></c:out></h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
    
                    <div class="offcanvas-body">
                        <ul class="navbar-nav flex-grow-1 pe-3">
                            <li class="nav-item">
                                <a href="" class="btn nav-link">Iniciar Sesión</a>
                            </li>
                            <li class="nav-item">
                                <form  method="POST" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="submit" value="Cerrar Sesión" class="btn nav-link"/>
                                </form>
                            </li>
                            <li class="nav-item">
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <main role="main" class="container abajo">
            <div class="text-center" style="color: rgb(255, 255, 255);">
                <h1 class="tipoletra">Escucha y Crea</h1>
                <h2 class="tipoletrados">Pon a prueba tu lado Artistico con Beatify</h2>
                <br>
                <a href="" class="btn btn-outline-light sombra">Registrate!</a>
            </div>
        </main>
    </div>
    <footer>
        <main role="main" class="container">
            <img class="logofooter espacio float-start" src="/css/images/logoblancoynegro.png" alt="">
            <div class="espacio letra alinear">
                <h6>SERVIVIO AL CLIENTE</h6>
                <ul>
                    <li>Acerca de</li>
                    <li>Terminos y Condiciones</li>
                    <li>Privacidad y Seguridad</li>
                    <li>Representante Legal</li>
                    <li>Orden de Servicio</li>
                    <li>Bases y Promociones</li>
                </ul>
            </div>
            <div class="espacio letra alinear">
                <h6>COMUNIDAD</h6>
                <ul>
                    <li>Servicio para Artistas</li>
                    <li>Publicidad</li>
                    <li>Proveedores</li>
                    <li>Inversionistas</li>
                </ul>
            </div>
            <div class="espacio letra redes text-center float-end">
                <h6>Siguenos en:</h6>
                <img class="logoredes imagen" src="/css/images/facebook.png" alt="">
                <img class="logoredes imagen" src="/css/images/twitter.png" alt="">
                <img class="logoredes imagen" src="/css/images/youtube.png" alt="">
                <img class="logoredes imagen" src="/css/images/discord.png" alt="">
                <h6>CONTACTANOS</h6>
                <h6>Beatify@gmail.com</h6>
            </div>
            <div class="text-center espacio letra">
                <p>Chile 2021 Beatify</p>
                <p>Legal / Centro de Privacidad / Politica de privacidad / Cookies</p>
            </div>
        </main>
    </footer>
</body>
</html>