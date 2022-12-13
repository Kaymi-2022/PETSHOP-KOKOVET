
<%@page import="es.KOKOVET.MODEL.ClienteDAO"%>
<%@page import="es.KOKOVET.MODEL.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Nueva Mascota</title>
        <link href="./ESTILOS.CSS/app.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    </head>

    <body>
        <%
            if (request.getAttribute("mensaje") != null) {
                Object msg = request.getAttribute("mensaje");
        %>
        <script>
            window.alert('<%=msg%>');
        </script>
        <%
            }
        %>

        <div class="wrapper">
            <%@include file="../includes/Sidebar.jsp" %>

            <div class="main">
                <%@include file="../includes/Navbar.jsp" %>

                <main class="content">
                    <div class="container-fluid p-0">
                        <div class="row">
                            <div class="col-12 col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Nueva Mascota</h5>
                                        <hr>
                                    </div>
                                    <form method="GET" action="./ControlMascota">
                                        <div class="card-body">


                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>Cliente</label>
                                                    <select class="form-control" name="cliente" required="">
                                                        <option value="">:::Seleccione:::</option>
                                                        <%
                                                            ClienteDAO cliDAO = new ClienteDAO();

                                                            for (Cliente c : cliDAO.ListarTodos()) {
                                                                out.print("<option value='" + c.getId() + "'>" + c.getApellidos() + " , " + c.getNombres() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Color</label>
                                                    <input type="text" class="form-control" required="" name="color">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Sexo</label>
                                                    <select class="form-control form-select" required="" name="sexo">
                                                        <option>:::Seleccione</option>
                                                        <option value="M">Masculino</option>
                                                        <option value="F">Femenino</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Fecha Nacimiento</label>
                                                    <input type="date" class="form-control" required="" name="nacimiento">
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>Nombre</label>
                                                    <input type="text" class="form-control" required="" name="nombre">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Especie</label>
                                                    <input type="text" class="form-control" required="" name="especie">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Raza</label>
                                                    <input type="text" class="form-control" required name="raza">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Fecha Ingreso</label>
                                                    <input type="date" class="form-control" required="" name="ingreso">
                                                </div>
                                            </div>

                                            <hr>
                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                                        <input type="hidden" name="accion" value="nueva_mascota">
                                                        <button type="submit" class="btn btn-primary">GUARDAR</button> 
                                                        <button type="reset" class="btn btn-danger">CANCELAR</button>
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
        <script src="../FUNCIONALIDADES/app.js" type="text/javascript"></script>
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
    </body>
</html>