<%-- 
    Document   : Products
    Created on : 19 nov. 2022, 00:25:23
    Author     : MICHAEL
--%>

<%@page import="java.util.Iterator"%>
<%@page import="es.KOKOVET.MODEL.Productos"%>
<%@page import="java.util.List"%>
<%@page import="es.KOKOVET.MODEL.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../ESTILOS.CSS/EstilosIndex.css">
        <link rel="stylesheet" href="../ESTILOS.CSS/EstilosVistasAdicionales.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/12f3bc59b2.js" crossorigin="anonymous"></script>
        <title>Document</title>
    </head>

    <body>
        <header class="site-header sticky-top py-1 bg-perzonalizado">
            <%@include file="Header.jsp"%>
        </header>
        <main>
            <div class="album py-5 bg-body-personalizado">
                <div class="container">
                    <div class="d-flex justify-content-around">
                        <select class="container form-select offset-md-1 ">
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <select class="container form-select offset-md-1 ">
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <select class="container form-select  offset-md-1">
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <select class="container form-select offset-md-1 ">
                            <option selected>Open this select menu</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <section class="py-5 text-center container">
                        <div class="row py-lg-5">
                            <div class="col-lg-6 col-md-8 mx-auto">
                                <h1 class="text-success fs-2">Album de Productos</h1>
                                <p class="lead text-dark fs-3">Aqui encontraras los mejores productos a tu alcance para satisfacer a tu amigos mascotas</p>
                                <p class="fs-2">
                                    <a href="#" class="btn btn-outline-danger btn-lg">FILTRAR PRODUCTO</a>
                                </p>
                            </div>
                        </div>
                    </section>

                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 text-center fs-4">
                        <% ProductoDAO pdao = new ProductoDAO();
                            List<Productos> listaproductos = pdao.listar();
                            Iterator<Productos> listP = listaproductos.iterator();
                            Productos p = null;
                            while (listP.hasNext()) {
                                p = listP.next();

                        %>                        
                        <div class="col">
                            <div class="card shadow-sm">
                                <p class="card-header"><%= p.getNombres()%></p>
                                <p class="card-body">
                                    <img src="../ControladorIMGP?id=<%=p.getId()%>" class="bd-placeholder-img card-img-top" width="100%"
                                         height="225" role="img" aria-label="Placeholder: Thumbnail"
                                         preserveAspectRatio="xMidYMid slice" focusable="false">
                                    </img>
                                </p>
                                <div class="card-footer">
                                    <p class="card-text"><%= p.getDescripcion()%></p>
                                    <p class="card-text"><%= p.getPrecio()%></p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-block">
                                            <button type="button" class="btn btn-sm btn-danger">Comprar</button>
                                            <button type="button" class="btn btn-sm btn-primary">Añadir al Carrito</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </main>
        <!--FOOTERN -->
        <footer class="container-fluid py-5 bg-perzonalizado text-dark d-flex justify-content-around">
            <%@include file="Footer.jsp"%>%>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <script src="../FUNCIONALIDADES/FuncionNavegacion.js" type="text/javascript"></script>
        <script src="../FUNCIONALIDADES/FuncionLogin.js" type="text/javascript"></script>
    </body>
</html>
