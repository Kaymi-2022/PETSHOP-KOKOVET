<%-- 
    Document   : FormularioRegistrarse
    Created on : 18 nov. 2022, 20:27:19
    Author     : MICHAEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FORMULARIO REGISTRO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../ESTILOS.CSS/EstilosLogin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/12f3bc59b2.js" crossorigin="anonymous"></script>
    </head>
    <body class="container fs-2">
        <main class="mx-auto p-3">
            <div class="row">

                <div class="fs-1 fw-bold p-3">
                    <p class="p-5 text-center">FORMULARIO DE REGISTRO</p>
                </div>

            </div>

            <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">

                <div class="col-md-4">
                    <img src="../IMG/budin.png" class="rounded mx-auto d-block " alt="..." width="100%" max-height="70%">
                </div>
                <div class="col-md-8">
                    <form action="../Controlador" method="POST" enctype="multipart/form-data" class="row">
                        <div class="col-md-6  form-group">
                            <label class="form-label" for="inputId">ID</label> <br>
                            <input type="text" name="inputID">
                        </div>
                        <div class="col-md-6  form-group">
                            <label class="form-label" for="inputId">DNI</label> <br>
                            <input type="text" name="inputDNI">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">NOMBRE</label> <br>
                            <input type="text" name="inputNombre">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">APELLIDO</label> <br>
                            <input type="text" name="inputApellidos">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">TELEFONO</label> <br>
                            <input type="text" name="inputTelefono">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">EMAIL</label> <br>
                            <input type="text" name="inputEmail">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">CLAVE</label> <br>
                            <input type="password" name="inputPassword">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">DEPARTAMENTO</label> <br>
                            <input type="text" name="inputDepartamento">
                        </div>
                        <div class="col-md-6  form-group">
                            <label for="inputId">DISTRITO</label> <br>
                            <input type="text" name="inputDistrito">
                        </div>
                        <div class="col-md-6  form-groupp">
                            <label for="inputId">DIRECCION</label> <br>
                            <input type="text" name="inputDireccion">
                        </div>
                        <div class="col-md-6  form-group p-3">
                            <label for="inputId">DIRECCION</label> <br>
                            <input class="form-control" type="file" name="FileFoto">
                        </div>
                        <input class="btn btn-danger" role="button" type="submit" name="accion" value="registrarCliente">
                    </form>

                </div>

            </div>

        </main>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
