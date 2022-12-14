<%-- 
    Document   : estadoDePedido
    Created on : 18 nov. 2022, 23:16:17
    Author     : SEBAS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="bg-card-personalizado">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESTADO DE PEDIDOS</title>  
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="./ESTILOS.CSS/EstilosVistasAdicionales.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </head>
    <%@include file="../ESTILOS.CSS/styles.jsp"%>
    <%@include file="../ESTILOS.CSS/stylesProductos.jsp"%>


    <body>
        <main class="container_general bg-card-personalizado">
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
                <div class="seccion">
                    <a href="./ControladorCarrito?accion=Salir"><h2>CERRAR SESION</h2></a>
                </div>
            </div>
            <div class="container">
                <hr>
                <div class="row align-items-start">
                    <div class="col-9">
                        <h1>Gestion de Pedidos de Compras</h1>
                    </div>
                </div>
                <hr>
                <div class="table-responsive">
                    <table class="table table-striped" id="mydataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>USUARIO</th>
                                <th>CORREO</th>
                                <th>FECHA DE COMPRA</th>
                                <th>PAGO</th>
                                <th>ESTADO</th>
                                <th>ACTUALIZAR</th>
                            </tr> 
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${compras}">
                                <tr>
                                    <td class="idpedido">${c.getId()}</td>
                                    <td>${c.getCliente().getNombres()}</td>
                                    <td>${c.getCliente().getEmail()}</td>
                                    <td>${c.getFecha()}</td>
                                    <td>${c.getMonto()}</td>
                                    <td class="estadop">${c.getEstado()}</td>
                                    <td>
                                        <button type="button" class="btn btn-dark btnEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Actualizar Estado</button>
                                    </td>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

    </body>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR ESTADO DE PEDIDO</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.servletContext.contextPath}/ControladorEstadoPedido" method="GET" role="form" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-12">
                                <div class="col-4">
                                    <label>ID DE PEDIDO</label>
                                    <input type="text" name="txtIDestado" class="form-control" id="txtIDestado" readonly="true" >
                                </div>
                                <br>
                                <div class="col-8">
                                    <label>ESTADO DE PEDIDO</label>
                                    <select name="ESTADO" id="estadopedido" class="form-select" aria-label="Default select example">

                                        <option selected value="1">Cancelado - En Proceso de Envio</option>
                                        <option value="2" >Entregado</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</a>
                            <button type="submit" name="accion" value="btnEditar" class="btn btn-danger btnOcultar">ACTUALIZAR ESTADO PEDIDO</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
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
</html>