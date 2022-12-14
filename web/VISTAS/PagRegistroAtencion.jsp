

<%@page import="es.KOKOVET.MODEL.Mascota"%>
<%@page import="es.KOKOVET.MODEL.MascotaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Registro Atención</title>
        <link href="./ESTILOS.CSS/app.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    </head>

    <body>    <%
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
                                    <form method="GET" action="../ControlAtencionMascota">
                                        <div class="card-body">
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>Mascota</label>
                                                    <select class="form-control" name="mascota" required="">
                                                        <option value="">:::Seleccione:::</option>
                                                        <%
                                                            MascotaDAO mascDAO = new MascotaDAO();

                                                            for (Mascota c : mascDAO.ListarTodos()) {
                                                                out.print("<option value='" + c.getIdMascota() + "'>" + c.getIdMascota() + " - " + c.getNombre() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Temperatura</label>
                                                    <input type="number" class="form-control" name="temperatura" required="">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Fecha Atención</label>
                                                    <input type="date" class="form-control" name="fechaAtencion" required="">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Motivo</label>
                                                    <input type="text" class="form-control" name="motivo" required="">
                                                </div>

                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>Altura</label>
                                                    <input type="number" class="form-control" name="altura" required="">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Hora</label>
                                                    <input type="time" class="form-control" name="hora" required="">
                                                </div>

                                                <div class="col-sm-3">
                                                    <label>Estado</label>
                                                    <input type="text" class="form-control" name="estado" required="">
                                                </div>
                                                <div class="col-sm-3 mt-3">
                                                    <button type="submit" class="btn btn-primary">INGRESAR FICHA</button> 

                                                </div>
                                            </div>

                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <label>Diagsnotico</label>
                                                    <textarea class="form-control" rows="4" name="diagnostico" required=""></textarea>
                                                </div>
                                            </div>

                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <label>Descripción</label>
                                                    <textarea class="form-control" rows="4" name="descripcion" required=""></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="accion" value="nueva_atencion">
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