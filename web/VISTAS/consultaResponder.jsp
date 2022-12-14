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
        <title>CONSULTAS DE CLIENTES</title>   
        <link href="./ESTILOS.CSS/EstilosVistasAdicionales.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./cssadmin/stilosAdmin.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>

    </head>
    <%@include file="../ESTILOS.CSS/styles.jsp"%>
    <%@include file="../ESTILOS.CSS/stylesProductos.jsp"%>
    <%@include file="../ESTILOS.CSS/stylesConsultResponder.jsp"%>

    <body class="bg-card-personalizado">
        <main class="container_general">
            <div class="container_lateral">
                <div class="seccion_imagen">
                    <div class="contenedor_imagen">
                        <img src="./IMG/Admin-Profile-Vector-PNG-Isolated-HD.png" alt="imagen de perfil">
                    </div>
                    <h1>ADMIN</h1>
                </div>
                <div class="seccion">
                    <a href="./ControladorCarrito?accion=mantenimientoProductos"><h2>Mantenimiento de productos</h2></a>
                </div>
                <div class="seccion">
                    <a href="./ControladorCarrito?accion=mantenimientoCliente"><h2>Mantenimiento de clientes</h2></a>
                </div>
                <div class="seccion">
                    <a href="./ControladorCarrito?accion=mantenimientoPedido"><h2>Estado de pedidos</h2></a>
                </div>
                <div class="seccion">
                    <a href="./ControladorCarrito?accion=consultasClientes"><h2>Consultas a responder</h2></a>
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
                        <a href="./ControladorCarrito?accion=Salir"> <p>CERRAR SESION</p></a>
                    </div>
                </div>

                <div class="contendoResponder">
                    <div class="parteSuperior">
                        <div class="Correos">
                            <div class="scrolll">
                                <div class="table-responsive">
                                    <h2>CORREOS</h2>
                                    <table class="table table-striped" id="mydataTable">
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
                                                <td>mauel@gmail</td>
                                                <td> <a href="#"> Seleccionar </a> </td>
                                            </tr>
                                            <tr>
                                                <td>mauel@gmail</td>
                                                <td> <a href="#"> Seleccionar </a> </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
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
                <br><b><br>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" ></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.all.min.js"></script>

        <%
            if (request.getAttribute("message") != null) {
        %>
        <script>
            $(document).ready(function () {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: '<%= request.getAttribute("message")%>',
                    showConfirmButton: false,
                    timer: 3000
                });
            });
        </script>
        <%
            }
        %>
        <script src="../FUNCIONALIDADES/funciones.js" type="text/javascript"></script>
        <script src="${pageContext.servletContext.contextPath}/FUNCIONALIDADES/productos.js"></script>
    </body>
</html>