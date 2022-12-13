<%-- 
    Document   : mantenimientoDeProductos
    Created on : 18 nov. 2022, 23:15:54
    Author     : SEBAS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GESTION DE CLIENTES</title>   
        <link href="./ESTILOS.CSS/EstilosVistasAdicionales.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>

    </head>
    <%@include file="../ESTILOS.CSS/styles.jsp"%>
    <%@include file="../ESTILOS.CSS/stylesProductos.jsp"%>

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
                    <div class="col-9"><h1>Gestion de Accesos</h1></div>
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
                                <th>DNI</th>
                                <th>NOMBRES</th>
                                <th>APELLIDOS</th>
                                <th>DIRECCION</th>
                                <th>EMAIL</th>
                                <th>CONTRASEÑA</th>
                                <th>TELEFONO</th>
                                <th>DISTRITO</th>
                                <th>ROL</th>
                                <th>ESTADO</th>
                                <th>ACTUALIZAR</th>
                                <th>BORRAR</th>
                            </tr> 
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${clientes}">
                                <tr>
                                    <td class="id">${c.getId()}</td>
                                    <td class="dni">${c.getDni()}</td>
                                    <td class="nom">${c.getNombres()}</td>
                                    <td class="ape">${c.getApellidos()}</td>
                                    <td class="direc">${c.getDireccion()}</td>
                                    <td class="email">${c.getEmail()}</td>
                                    <td class="pass">${c.getPass()}</td>
                                    <td class="tel">${c.getTelefono()}</td>
                                    <td class="dis">${c.getDistrito()}</td>
                                    <td class="rol">${c.getRol()}</td>
                                    <td class="es">${c.getEstado()}</td>
                                    <td>
                                        <button type="button" class="btn btn-dark botonEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger botonEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Eliminar</button>
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
                            <h5 class="modal-title" id="exampleModalLabel">Datos de los Usuarios</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="./Controlador" method="POST" method="POST" role="form" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-6">
                                        <label>ID ACCESOS</label>
                                        <input type="text" name="txtId" class="form-control" name="txtId" id="txtId" readonly="true" >
                                    </div>
                                 </div><br>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="nombre">Nombres</label>
                                        <input type="text" required placeholder="nombres" class="form-control"  name="txtnom" id="txtnom">
                                    </div>
                                    <div class="col-6">
                                        <label for="apellido">Apellidos</label>
                                        <input class="form-control"  type="text" required placeholder="Apellido" name="txtap" id="txtap">
                                    </div>
                                 </div><br>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="dodigoP">DNI</label>
                                        <input class="form-control"  type="text" required placeholder="Dni" name="txtdni" id="txtdni" >
                                    </div>
                                    <div class="col-6">
                                        <label for="direccion">Direccion</label>
                                        <input class="form-control"  type="text" required placeholder="Direccion" name="txtdirec" id="txtdirec">
                                    </div>
                                 </div><br>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="distrito">Distrito</label>
                                        <input class="form-control"  type="text" required placeholder="Distrito" name="txtdis" id="txtdis" >
                                    </div>
                                    <div class="col-6">
                                        <label for="dodigoP">Telefono</label>
                                        <input class="form-control"  type="tel" required placeholder="Telefono" name="txttel" id="txttel" >
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="direccion">EMAIL</label>
                                        <input class="form-control"  type="email" required placeholder="email" name="txtem" id="txtem" >
                                    </div>
                                    <div class="col-6">
                                        <label for="distrito">CLAVE</label>
                                        <input class="form-control"  type="password" required placeholder="pass" name="txtpass" id="txtpass">
                                    </div>
                                 </div><br>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="direccion">ROL</label>
                                        <input class="form-control"  type="text" required placeholder="rol" name="txtrol" id="txtrol" >
                                    </div>
                                    <div class="col-6">
                                        <label for="distrito">ESTADO</label>
                                        <input class="form-control"  type="text" required placeholder="estado" name="txtes" id="txtes" >
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <button type="accion" name="btnGuardar" class="btn btn-success btnOcultar1">Guardar</button>
                                        <button type="accion" name="btnEditar" class="btn btn-dark btnOcultar">Editar</button>
                                        <button type="accion" name="btnEliminar" class="btn btn-danger btnOcultar">Eliminar</button>
                                        <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
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
        <script src="./FUNCIONALIDADES/funciones.js" type="text/javascript"></script>
        <script src="${pageContext.servletContext.contextPath}/FUNCIONALIDADES/productos.js"></script>
    </body>
</html>