/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.ProductoDAO;
import es.KOKOVET.MODEL.Productos;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
@MultipartConfig
@WebServlet(name = "ControladorMantenimientoProductos", urlPatterns = {"/ControladorMantenimientoProductos"})
public class ControladorMantenimientoProductos extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();

    int res;
    int id;
    String nombreP;
    Part part;
    InputStream foto;
    String descripcion;
    Double precio;
    int stock;
    Productos p;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String mensaje = "Error";
            String accion = request.getParameter("accion");

            switch (accion) {

                case "btnEditar":
                    //Captura de datos
                    id = Integer.parseInt(request.getParameter("txtId"));
                    nombreP = request.getParameter("txtNombre");
                    part = request.getPart("fileFoto");
                    foto = part.getInputStream();
                    descripcion = request.getParameter("txtDescripcion");
                    precio = Double.parseDouble(request.getParameter("txtPrecio"));
                    stock = Integer.parseInt(request.getParameter("txtStock"));
                    p = new Productos(id, nombreP, foto, descripcion, precio, stock);
                    res = pdao.actualizarProducto(p);
//                    res=1;
                    if (res != 0) {
                        mensaje = "Registro Modificado";
                    }
                    break;
                case "btnEliminar":
                    //Captura de datos
                    id = Integer.parseInt(request.getParameter("txtId"));
                    nombreP = request.getParameter("txtNombre");
                    part = request.getPart("fileFoto");
                    foto = part.getInputStream();
                    descripcion = request.getParameter("txtDescripcion");
                    precio = Double.parseDouble(request.getParameter("txtPrecio"));
                    stock = Integer.parseInt(request.getParameter("txtStock"));
                    p = new Productos(id, nombreP, foto, descripcion, precio, stock);
                    res = pdao.eliminarProducto(p);
                    if (res != 0) {
                        mensaje = "Registro Eliminado";
                    }
                    break;
                case "btnGuardar":
                    nombreP = request.getParameter("txtNombre");
                    part = request.getPart("fileFoto");
                    foto = part.getInputStream();
                    descripcion = request.getParameter("txtDescripcion");
                    precio = Double.parseDouble(request.getParameter("txtPrecio"));
                    stock = Integer.parseInt(request.getParameter("txtStock"));
                    p = new Productos();
                    p.setNombres(nombreP);
                    p.setFoto(foto);
                    p.setDescripcion(descripcion);
                    p.setPrecio(precio);
                    p.setStock(stock);
                    res = pdao.AgregarNuevoProducto(p);
//                res = 1;
                    if (res != 0) {
                        mensaje = "Registro Agregado";
                    }
                    if (res != 0) {
                        mensaje = "Registro Agregado";
                    }

            }
            request.setAttribute("message", mensaje);
            request.setAttribute("productos", pdao.listar());
            request.getRequestDispatcher("/VISTAS/indexAdmin.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error " + e.getLocalizedMessage());
        }
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
        processRequest(request, response);
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
