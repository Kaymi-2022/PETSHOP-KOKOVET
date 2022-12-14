
<%@page import="es.KOKOVET.MODEL.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Anexo</title>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="./ESTILOS.CSS/app.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    </head>

    <body>  <%
        if (request.getAttribute("mensaje") != null) {
            Object msg = request.getAttribute("mensaje");
        %>
        <script>
            window.alert('<%=msg%>');
        </script>
        <%
            }
        %>

        <%
            Mascota objMasc = null;
            int nroAtencion = 0;
            if (request.getParameter("nroAtencion") != null) {
                nroAtencion = Integer.parseInt(request.getParameter("nroAtencion"));
                objMasc = new MascotaDAO().BuscarDatosAtencion(nroAtencion);
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
                                        <h5 class="card-title mb-0">Anexo</h5>
                                        <hr>
                                    </div>

                                    <div class="card-body">
                                        <form method="get" action="./Controlador">
                                            <div class="row mb-3">
                                                <div class="col-sm-3">
                                                    <label>Nro Atención</label>
                                                    <input type="number" min="1" id="nroAtencion" name="nroAtencion" required="" class="form-control" value="<%=nroAtencion%>"> 
                                                </div>
                                                <div class="col-sm-3 mt-3">
                                                    <button type="submit" name="accion" value="PagAnexo" class="btn btn-primary">Consultar</button>
                                                </div>
                                            </div>
                                            <hr>
                                        </form>

                                        <form method="POST" action="./ControlAtencionMascota">

                                            <div class="row mb-3">
                                                <div class="col-sm-4">
                                                    <label>Paciente</label>
                                                    <input type="text" id="lbPaciente" required="" class="form-control" readonly="" value="<%=objMasc == null ? "Sin datos" : objMasc.getCliente()%>">
                                                </div>
                                                <div class="col-sm-4">
                                                    <label>Mascota</label>
                                                    <input type="text" id="lbMascota" required="" class="form-control" readonly="" value="<%=objMasc == null ? "Sin datos" : objMasc.getNombre()%>">
                                                </div>
                                            </div>
                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <label>Receta Medica</label>
                                                    <textarea class="form-control" rows="4" name="receta" required=""></textarea>
                                                </div>
                                            </div>

                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <label>Indicaciones</label>
                                                    <textarea class="form-control" rows="4" name="indicaciones" required=""></textarea>
                                                </div>
                                            </div>
                                            <div class="row mb-3" >
                                                <div class="col-sm-12">
                                                    <input type="hidden" name="accion" value="generar_ficha">
                                                    <input type="hidden" name="idAtencion" value="<%=nroAtencion%>">
                                                    <button type="submit" class="btn btn-success">GENERAR FICHA MEDICA</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>                                                   
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