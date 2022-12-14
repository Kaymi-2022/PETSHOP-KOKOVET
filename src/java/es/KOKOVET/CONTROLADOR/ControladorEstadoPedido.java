/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.ComprasDAO;
import es.KOKOVET.MODEL.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MICHAEL
 */
@WebServlet(name = "ControladorEstadoPedido", urlPatterns = {"/ControladorEstadoPedido"})
public class ControladorEstadoPedido extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    int resp = 0;
    String mensaje;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");
            if (accion != null) {
                int idestado = Integer.parseInt(request.getParameter("txtIDestado"));
                int estado = Integer.parseInt(request.getParameter("ESTADO"));
                String estadope;
                if (estado==1) {
                    estadope="Cancelado - En Proceso de Envio";
                } else {
                    estadope="COMPLETADO";
                }
                resp = pdao.actualizarPedido(estadope, idestado);
                if (resp != 0) {
                    mensaje = "CAMBIO EL ESTADO DEL PEDIDO A COMPLETADO";
                } else {
                    mensaje = "ERROR";
                }
                request.getRequestDispatcher("./ControladorCarrito?accion=mantenimientoPedido").forward(request, response);
            }
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
