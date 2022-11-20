<%-- 
    Document   : Login
    Created on : 20 nov. 2022, 00:18:25
    Author     : MICHAEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="../ESTILOS.CSS/EstilosLogin.css"/>
    </head>
    <body class="container">
        <div class="center">
            <div class="ear ear--left"></div>
            <div class="ear ear--right"></div>
            <div class="face">
                <div class="eyes">
                    <div class="eye eye--left">
                        <div class="glow"></div>
                    </div>
                    <div class="eye eye--right">
                        <div class="glow"></div>
                    </div>
                </div>
                <div class="nose">
                    <svg width="38.161" height="22.03">
                    <path d="M2.017 10.987Q-.563 7.513.157 4.754C.877 1.994 2.976.135 6.164.093 16.4-.04 22.293-.022 32.048.093c3.501.042 5.48 2.081 6.02 4.661q.54 2.579-2.051 6.233-8.612 10.979-16.664 11.043-8.053.063-17.336-11.043z" fill="#243946"></path>
                    </svg>
                    <div class="glow"></div>
                </div>
                <div class="mouth">
                    <svg class="smile" viewBox="-2 -2 84 23" width="84" height="23">
                    <path d="M0 0c3.76 9.279 9.69 18.98 26.712 19.238 17.022.258 10.72.258 28 0S75.959 9.182 79.987.161" fill="none" stroke-width="3" stroke-linecap="square" stroke-miterlimit="3"></path>
                    </svg>
                    <div class="mouth-hole"></div>
                    <div class="tongue breath">
                        <div class="tongue-top"></div>
                        <div class="line"></div>
                        <div class="median"></div>
                    </div>
                </div>
            </div>
            <div class="hands">
                <div class="hand hand--left">
                    <div class="finger">
                        <div class="bone"></div>
                        <div class="nail"></div>
                    </div>
                    <div class="finger">
                        <div class="bone"></div>
                        <div class="nail"></div>
                    </div>
                    <div class="finger">
                        <div class="bone"></div>
                        <div class="nail"></div>
                    </div>
                </div>
                <div class="hand hand--right">
                    <div class="finger">
                        <div class="bone"></div>
                        <div class="nail"></div>
                    </div>
                    <div class="finger">
                        <div class="bone"></div>
                        <div class="nail"></div>
                    </div>
                    <div class="finger">
                        <div class="bone"></div>
                        <div class="nail"></div>
                    </div>
                </div>
            </div>
            <form action="../ControladorCliente" method="POST" enctype="multipart/form-data">
                <div class="login">
                    <label>
                        <div class="fa fa-phone"></div>
                        <input class="username" type="email" name="imputCorreo" autocomplete="on" placeholder="Ingrese su Correo"/>
                    </label>
                    <label>
                        <div class="fa fa-commenting"></div>
                        <input class="password" type="password" name="imputPassword" autocomplete="off" placeholder="Password"/>
                        <!--<button class="password-button">ver</button> -->
                    </label>
                    <input class="login-button" role="button" type="submit" name="accion" value="Iniciar Sesion">
                </div>
                <div class="footer">Login</div>
                <div class="footer">
                    <a onclick="RegistrarseLogin()" class="btn btn-danger">Registrarse</a>
                </div>
            </form>
        </div>
        <script src="../FUNCIONALIDADES/FuncionLogin.js" type="text/javascript"></script>
        <script src="../FUNCIONALIDADES/FuncionNavegacion.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</body>
</html>
