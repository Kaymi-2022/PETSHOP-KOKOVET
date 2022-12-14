<%-- 
    Document   : indexAdmin
    Created on : 18 nov. 2022, 22:53:46
    Author     : SEBAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </head>
    <%@include file="../CSS/styles.jsp"%>
    <%@include file="../CSS/stylesProductos.jsp"%>

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
                    <a href="#"><h2>Mantenimiento de productos</h2></a>
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
                        <h2>MANTENIMIENTO DE PRODUCTOS</h2>
                    </div>
                    <div class="parte2">
                        <h2>ADMIN</h2>
                    </div>
                    <div class="parte3">
                        <a href="url"> <p>CERRAR SESION</p></a>
                    </div>
                </div>

                <div class="products">
                    <div class="insertar">
                        <form action="#" method="post" enctype="multipart/form-data">
                            <div class="inputs1">
                                <label for="dodigoP">Codigo del producto</label>
                                <input type="text" required placeholder="Codigo del producto" name="codigoP">
                                <label for="tipoP">Tipo del producto</label>
                                <input type="text" required placeholder="Tipo de producto" name="tipoP" >
                                <label for="dodigoP">Nombre del producto</label>
                                <input type="text" required placeholder="Nombre del producto" name="nombreP" >
                            </div>
                            <div class="inputs1">
                                <label for="precio">Precio</label>
                                <input type="text" required placeholder="Precio" name="precio" >
                                <label for="stock">Stock</label>
                                <input type="text" required placeholder="Stock" name="stock" >
                                <label for="detalle">Detalle</label>
                                <input type="text" required placeholder="Detalle" name="detalle" >
                            </div>

                            <div class="inputs1 botones"> 
                                <input type="submit" value="Agregar" name="Agregar" class="boton" >
                            </div>  
                        </form>
                    </div>
                    <div class="vista">
                        <div class="descargar">
                            <a href="#" target="programas">Descargar Reporte</a>
                        </div>    
                        <div class="infoContent">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>PRODUCTO</th>
                                        <th>CANTIDAD</th>
                                        <th>TIPO</th>
                                        <th>PRECIO</th>
                                        <th>DETALLE</th>
                                        <th>ACTUALIZAR</th>
                                        <th>BORRAR</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a class="actualizar" href="./Editar/editarProducto.php?id=<?php echo $row['id']?>"><i class="fa-solid fa-pen-to-square"></i></a>

                                        </td>
                                        <td>
                                            <a class="elminar" href="./Eliminar/eliminarProducto.php?id=<?php echo $row['id']?>"><i class="fa-solid fa-trash-can"></i></a> 
                                        </td>   
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
