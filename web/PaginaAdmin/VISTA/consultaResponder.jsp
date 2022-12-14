<%-- 
    Document   : consultaResponder
    Created on : 18 nov. 2022, 23:16:27
    Author     : SEBAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>    
        <link rel="stylesheet" href="./cssadmin/stilosAdmin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>

    </head>
    <%@include file="../CSS/styles.jsp"%>
    <%@include file="../CSS/stylesProductos.jsp"%>
    <%@include file="../CSS/stylesConsultResponder.jsp"%>

    <body>
        <main class="container_general">
            <div class="container_lateral">
                <div class="seccion_imagen">
                    <div class="contenedor_imagen">
                        <img src="../imagenes/Admin-Profile-Vector-PNG-Isolated-HD.png" alt="imagen de perfil">
                    </div>
                    <h1>ADMIN</h1>
                </div>
                <div class="seccion">
                    <a href="./indexAdmin.jsp"><h2>Mantenimiento de productos</h2></a>
                </div>
                <div class="seccion">
                    <a href="./mantenimientoDeClientes.jsp"><h2>Mantenimiento de clientes</h2></a>
                </div>
                <div class="seccion">
                    <a href="./estadoDePedido.jsp"><h2>Estado de pedidos</h2></a>
                </div>
                <div class="seccion">
                    <a href="./consultaResponder.jsp"><h2>Consultas a responder</h2></a>
                </div>

            </div>

            <div class="ventas">
                <div class="barra_top">
                    <div class="parte1">
                        <h2>CONSULTAS A RESPONDER</h2>
                    </div>
                    <div class="parte2">
                        <h2>ADMIN</h2>
                    </div>
                    <div class="parte3">
                        <a href="url"> <p>CERRAR SESION</p></a>
                    </div>
                </div>

                <div class="contendoResponder">
                    <div class="parteSuperior">
                        <div class="Correos">
                            <h2>CORREOS</h2>
                            <div class="scrolll">
                            <table>
                                <thead>
                                    <tr>
                                        <th>CORREOS</th>
                                        <th>ACCION</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>colegioebastianpinto@gmail</td>
                                        <td> <a href="#"> Seleccionar </a> </td>
                                    </tr>
                                    <tr>
                                        <td>colegioebastianpinto@gmail</td>
                                        <td> <a href="#"> Seleccionar </a> </td>
                                    </tr>
                                    <tr>
                                        <td>colegioebastianpinto@gmail</td>
                                        <td> <a href="#"> Seleccionar </a> </td>
                                    </tr>
                                    <tr>
                                        <td>colegioebastianpinto@gmail</td>
                                        <td> <a href="#"> Seleccionar </a> </td>
                                    </tr>
                                    <tr>
                                        <td>colegioebastianpinto@gmail</td>
                                        <td> <a href="#"> Seleccionar </a> </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <div class="mensajesRecibidos">
                            <h2>MENSAJE RECIBIDO</h2>
                            <textarea id="id" name="name" rows="20" cols="70" readonly=""></textarea>
                        </div>
                    </div>
                    <div class="parteInferior">
                        <h2>Redactar</h2>
                        <textarea id="id" name="name" rows="5" cols="10"></textarea>
                        <div>
                            <a href="url">ENVIAR MENSAJE</a>
                        </div>
                    </div>
                </div>
        </main>
    </body>
</html>