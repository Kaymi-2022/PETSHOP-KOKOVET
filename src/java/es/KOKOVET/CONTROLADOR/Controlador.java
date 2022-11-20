/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.Cliente;
import es.KOKOVET.MODEL.ClienteDAO;
import es.KOKOVET.MODEL.ProductoDAO;
import es.KOKOVET.MODEL.Productos;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author MICHAEL
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
@MultipartConfig
public class Controlador extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    List<Productos> productos = new ArrayList<>();
    Cliente c = new Cliente();

    ClienteDAO cdao = new ClienteDAO();
    List<Cliente> listacliente = cdao.ListarClientes();
    String destino = "./VISTAS/Clientes.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idcliente"));
        cdao.listarImg(id, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher miDispatcher;
        String accion = request.getParameter("accion");
        productos = pdao.listar();
        String url = "";
        switch (accion) {
            case "ListarProductos":
                request.setAttribute("listar", productos);
                miDispatcher = request.getRequestDispatcher("/Productos.jsp");
                miDispatcher.forward(request, response);
                break;
            case "registrarCliente":
                int ID = Integer.parseInt(request.getParameter("inputID"));
                String DNI = request.getParameter("inputDNI");
                String nombre = request.getParameter("inputNombre");
                String apellidos = request.getParameter("inputApellidos");
                String telefono = request.getParameter("inputTelefono");
                String email = request.getParameter("inputEmail");
                String clave = request.getParameter("inputPassword");
                String departamento = request.getParameter("inputDepartamento");
                String distrito = request.getParameter("inputDistrito");
                String direccion = request.getParameter("inputDireccion");
                Part part = request.getPart("FileFoto");
                InputStream inputstream = part.getInputStream();
                c.setId(ID);
                c.setDNI(DNI);
                c.setNombre(nombre);
                c.setApellidos(apellidos);
                c.setTelefono(telefono);
                c.setEmail(email);
                c.setPassword(clave);
                c.setDepartamento(departamento);
                c.setDistrito(distrito);
                c.setDireccion(direccion);
                c.setFoto(inputstream);
                cdao.AgregarClientes(c);
                url = destino;
                miDispatcher = request.getRequestDispatcher(url);
                miDispatcher.forward(request, response);
                break;
            case "ListarClientes":
                request.setAttribute("Listar", listacliente);
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("listar", productos);
                miDispatcher = request.getRequestDispatcher("/Productos.jsp");
                miDispatcher.forward(request, response);
                break;
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
