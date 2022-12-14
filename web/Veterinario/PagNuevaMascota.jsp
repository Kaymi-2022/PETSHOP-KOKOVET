
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nueva Mascota</title>
        <link href="Estilos/app.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    </head>

    <body>
        <div class="wrapper">
            <%@include file="includes/Sidebar.jsp" %>

            <div class="main">
                <%@include file="includes/Navbar.jsp" %>

                <main class="content">
                    <div class="container-fluid p-0">
                        <div class="row">
                            <div class="col-12 col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Nueva Mascota</h5>
                                        <hr>
                                    </div>
                                    <form>
                                        <div class="card-body">
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>ID</label>
                                                    <input type="text" readonly="" class="form-control">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Color</label>
                                                    <input type="text" class="form-control">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Sexo</label>
                                                    <select class="form-control form-select">
                                                        <option>:::Seleccione</option>
                                                        <option value="M">Masculino</option>
                                                        <option value="F">Femenino</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Fecha Nacimiento</label>
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>Nombre</label>
                                                    <input type="text" readonly="" class="form-control">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Especie</label>
                                                    <input type="text" class="form-control">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Raza</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Fecha Ingreso</label>
                                                    <input type="date" class="form-control">
                                                </div>
                                            </div>

                                            <hr>
                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                        <button type="button" class="btn btn-primary">EDITAR</button> 
                                                        <button type="button" class="btn btn-success">GUARDAR</button>
                                                        <button type="button" class="btn btn-danger">BORRAR</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="js/app.js"></script>
    </body>
</html>