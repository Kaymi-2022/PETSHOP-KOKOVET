<%-- 
    Document   : Clientes
    Created on : 18 nov. 2022, 10:59:30
    Author     : MICHAEL
--%>

<%@page import="es.KOKOVET.MODEL.Cliente"%>
<%@page import="es.KOKOVET.MODEL.ClienteDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista clientes</h1>
    <center>
        <table>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DNI</th>
                        <th>NOMBRE</th>
                        <th>APELLIDOS</th>
                        <th>TELEFONO</th>
                        <th>EMAIL</th>
                        <th>PASSWORD</th>
                        <th>DEPARTAMENTO</th>
                        <th>DISTRITO</th>
                        <th>DIRECCION</th>
                        <th>FOTO</th>
                    </tr>
                </thead>
                <tbody>
                    <% ClienteDAO cdao = new ClienteDAO();
                        List<Cliente> listaclientes = cdao.ListarClientes();
                        Iterator<Cliente> listC = listaclientes.iterator();
                        Cliente c = null;
                        while (listC.hasNext()) {
                            c = listC.next();

                    %>
                    <tr>
                        <td><%=c.getId()%></td>
                        <td><%=c.getDNI()%></td>
                        <td><%=c.getNombre()%></td>
                        <td><%=c.getApellidos()%></td>
                        <td><%=c.getTelefono()%></td>
                        <td><%=c.getEmail()%></td>
                        <td><%=c.getPassword()%></td>
                        <td><%=c.getDepartamento()%></td>
                        <td><%=c.getDistrito()%></td>
                        <td><%=c.getDireccion()%></td>
                        <td><img src="ControladorIMGC?id=<%=c.getId()%>" width="150" height="150"/></td>
                </tr>
                <%}%>
                </tbody>
            </table>

        </table>
    </center>
</body>
</html>
