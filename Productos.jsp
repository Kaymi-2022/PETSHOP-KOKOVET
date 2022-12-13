<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>        
        <link href="../ESTILOS.CSS/EstilosLogin.css" rel="stylesheet" type="text/css"/>
        <title>Carrito de Compras</title>
    </head>
    <body >


        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="#"><i>KOKOVET Store</i></a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href=""><i class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./ControladorCarrito?accion=home"><i class="fas fa-plus-circle"></i> Ofertas del Dia</a>
                    </li>                   
                    <li class="nav-item">
                        <a class="nav-link" href="./ControladorCarrito?accion=carrito"><i class="fas fa-cart-plus">(<label style="color: darkorange">${cont}</label>)</i> Carrito</a>
                    </li> 
                </ul>
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <form action="ControladorCarrito" class="form-inline my-2 my-lg-0">
                    <input style="width:400px" class="form-control mr-sm-2" id="txtbuscar" name="txtbuscar">
                    <button type="submit" class="btn btn-outline-info my-2 my-sm-0" name="accion"  value="Buscar" id="btnBuscar"><i class="fas fa-search"></i> Buscar</button>
                    </form>            
                </ul>                                
                <ul class="navbar-nav btn-group my-2 my-lg-0" role="group">
                    <a style="color: white; cursor: pointer" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fas fa-user-tie"></i> ${logueo}</a>
                    <div class="dropdown-menu text-center dropdown-menu-right">
                        <a class="dropdown-item" href="#"><img src="IMG/login.jpg" alt="60" height="60"/></a>                        
                        <a class="dropdown-item" href="#">${user}</a>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal">${correo}</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="ControladorCarrito?accion=MisCompras">Mis Compras</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="./ControladorCarrito?accion=Salir"> <i class="fas fa-arrow-right"> Salir</i></a>                        
                    </div>
                </ul>       
            </div>
        </nav>
        <div class="bg-perzonalizado">
            <div class="container mt-4">
                <div class="card-group">
                    <c:forEach var="p" items="${productos}">
                        <div class="col-sm-4">
                            <div class="card-group">
                                <div class="card">
                                    <div class="card-header">
                                        <label class="col-sm-12">${p.getNombres()}</label>                                    
                                    </div>
                                    <div class="card-body text-center d-flex">
                                        <label>S/. ${p.getPrecio()}</i></label>
                                        <img src="ControladorIMGP?id=${p.getId()}" width="200" height="170">
                                    </div>
                                    <div class="card-footer">
                                        <div class="col-sm-12">
                                            <label>${p.getDescripcion()}</label>                                   
                                        </div>
                                        <div class=" col-sm-12 text-center">                                
                                            <a href="ControladorCarrito?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                            <a href="ControladorCarrito?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                        </div>                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!--FOOTERN -->
        <footer class="container-fluid py-5 bg-perzonalizado text-white d-flex justify-content-around bg-dark">
            <div class="row">
                <div class="col-12 col-md text-center align-center">
                    <img src="IMG/logo.png" alt="">
                    <p class="mb-3 p-3">&copy; 2022</p>
                </div>
                <div class="col-4 col-md">
                    <h4>CLINICA VETERINARIA KOKOVET</h4>
                    <ul class="list-unstyled text-small fs-5">
                        <li><p>Sede Surquillo</p></li>
                        <li><p>Telefono 964 979 979</p></li>
                        <li><p>Dirección</p></li>
                        <li><p>Av. Manuel Villaran 1016 Surquillo 15038</p></li>
                    </ul>
                </div>
                <div class="col-4 col-md">
                    <h4>SERVICIOS</h4>
                    <ul class="list-unstyled fs-5 text-muted ">
                        <li><a class="link-secondary text-secondary" href="#">Consultas</a></li>
                        <li><a class="link-secondary text-secondary" href="#">Vacunas</a></li>
                        <li><a class="link-secondary text-secondary" href="#">Madicina interna</a></li>
                        <li><a class="link-secondary text-secondary" href="#">Hospitalizacion</a></li>
                        <li><a class="link-secondary text-secondary" href="#">Grooming</a></li>
                    </ul>
                </div>
                <div class="col-4 col-md">
                    <h4>Te Ofrecemos las mejores marcas para tu Mascota</h4>
                    <div class="container p-3">
                        <div class="container">
                            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="IMG/producto_canbo.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="IMG/producto_catshow.png" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="IMG/producto_friskies.png" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="IMG/producto_mimaskot.png" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="IMG/Iproducto_proplan.png" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="IMG/producto_ricocan.jpg" class="d-block w-100" alt="...">
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <p>Escribenos a: sedessurquillo@kokovet.pe</p>
                </div>
            </div>
        </footer>
                <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="IMG/login.jpg" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="ControladorCarrito">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="ControladorCarrito?accion=Registrar" method="GET" enctype="multipart/form-data">                               
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="01245678">
                                        </div>
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Nombres">
                                        </div>
                                        <div class="form-group">
                                            <label>Apellidos</label>
                                            <input type="text" name="txtapellidos" class="form-control" placeholder="Apellidos">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Direccion">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <div class="form-group">
                                            <label>Telefono</label>
                                            <input type="text" name="txttel" class="form-control" placeholder="Telefono">
                                        </div>                                  
                                        <div class="form-group">
                                            <label>Distrito</label>
                                            <input type="text" name="txtdistrito" class="form-control" placeholder="Distrito">
                                        </div>                                  
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="../FUNCIONALIDADES/funciones.js" type="text/javascript"></script>
    </body>
</html>
