/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.Cliente;
import es.KOKOVET.MODEL.ClienteDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

/**
 *
 * @author MICHAEL
 */
@WebServlet(name = "ControladorRegistroCliente", urlPatterns = {"/ControladorRegistroCliente"})
public class ControladorCliente extends HttpServlet {

    ClienteDAO cdao = new ClienteDAO();
    List<Cliente> listacliente = cdao.ListarClientes();
    Cliente c = new Cliente();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ID = request.getParameter("inputID");
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
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
