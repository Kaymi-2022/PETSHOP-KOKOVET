<%-- 
    Document   : indexAdmin
    Created on : 18 nov. 2022, 22:53:46
    Author     : SEBAS
--%>
<%@page import="es.KOKOVET.MODEL.ProductoDAO"%>
<%@page import="es.KOKOVET.MODEL.Productos"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GESTION PRODUCTOS</title> 
        <link href="./ESTILOS.CSS/EstilosVistasAdicionales.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                    <a href="./ControladorCarrito?accion=indexAdmin"><h2>Mantenimiento de productos</h2></a>
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
                    <div class="col-9"><h1>Gestion de Productos</h1></div>
                    <div class="col-3 align-self-center">
                        <div class="d-grid gap-2">
                            <button type="button" class="btn btn-success btnAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button>
                        </div>                    
                    </div>
                </div>


                <hr>
                <div class="table-responsive">
                    <table class="table table-striped" id="mydataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>PRODUCTO</th>
                                <th>FOTO</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                <th>STOCK</th>
                                <th>ACTUALIZAR</th>
                                <th>BORRAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${productos}">
                                <tr>
                                    <td class="Idp">${p.getId()}</td>
                                    <td class="pnombre">${p.getNombres()}</td>
                                    <td ><img src="ControladorIMGP?id=${p.getId()}" width="80" height="80"></td>
                                    <td class="pdescrpcion">${p.getDescripcion()}</td>
                                    <td class="preciop">${p.getPrecio()}</td>
                                    <td class="stockp">${p.getStock()}</td>
                                    <td>
                                        <button type="button" class="btn btn-dark btnEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#exampleModal">Eliminar</button>
                                    </td>   
                                </tr>
                            </c:forEach>   
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Datos de los Productos</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.servletContext.contextPath}/ControladorMantenimientoProductos" method="POST" role="form" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="col-6">
                                            <label>ID PRODUCTO</label>
                                            <input type="text" name="txtId" class="form-control" id="txtId" readonly="true">
                                        </div>
                                        <label>Nombre</label>
                                        <input type="text" name="txtNombre" class="form-control" id="txtNombre" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label>Insertar Foto</label>
                                        <input type="file" min="17" name="fileFoto" class="form-control" id="fileFoto">
                                    </div>
                                    <div class="col-6">
                                        <label>Precio</label>
                                        <input type="text" min="17" name="txtPrecio" class="form-control" id="txtPrecio">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label>Stock</label>
                                        <input type="text" name="txtStock" class="form-control" id="txtStock">
                                    </div>
                                    <div class="col-6">
                                        <label>Descripcion</label>
                                        <input type="text" name="txtDescripcion" class="form-control" id="txtDescripcion">
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <button type="submit" name="accion" value="btnGuardar" class="btn btn-success btnOcultar1">Guardar</button>
                                        <button type="submit" name="accion" value="btnEditar" class="btn btn-dark btnOcultar">Editar</button>
                                        <button type="submit" name="accion" value="btnEliminar" id="1" class="btn btn-danger btnOcultar">Eliminar</button>
                                        <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
            <script src="${pageContext.servletContext.contextPath}/FUNCIONALIDADES/productos.js"></script>
    </body>
</html>
