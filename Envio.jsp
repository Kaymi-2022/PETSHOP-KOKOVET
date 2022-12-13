<%-- 
    Document   : Envio
    Created on : 2 dic. 2022, 04:04:25
    Author     : MICHAEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Tipo de envio de Producto</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark container-fluid">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>KOKOVET Store</i></a>
        </nav>
        <form action="./ControladorCarrito" method="GET">
            <div class="container position-absolute top-50 start-50 translate-middle">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">DELIVERY</h5>
                                <img src="./IMG/delivery.jpg" alt="" width="300" height="300"/>
                                <button type="submit" name="accion" value="metodoEnvio2" class="btn btn-outline-danger btn-block">DELIVERY</button>
                                <p>HORARIO DE ATENCION DESDE LAS 09:00 HRS HASTA LAS 21:00 HRS</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">RECOGO EN TIENDA</h5>
                                <img src="./IMG/Tienda.jpg" alt="" width="300" height="300"/>
                                <button type="submit" name="accion" value="metodoEnvio1" class="btn btn-outline-danger btn-block">RECOGO EN TIENDA</button>
                                <p>HORARIO DE ATENCION DE RECOGO LAS 12:00 HRS HASTA LAS 18:00 HRS</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
