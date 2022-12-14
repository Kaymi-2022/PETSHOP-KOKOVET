/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.Cliente;
import es.KOKOVET.MODEL.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MICHAEL
 */
@WebServlet(name = "ControladorMantenimientoClientes", urlPatterns = {"/ControladorMantenimientoClientes"})
public class ControladorMantenimientoClientes extends HttpServlet {

    int res;
    int id;
    String dni;
    String nom;
    String ap;
    String direc;
    String em;
    String pass;
    String tel;
    String dis;
    int rol;
    int es;
    ClienteDAO cldao;
    Cliente c;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String mensaje = "Error";
            String realizar = request.getParameter("realizar");

            switch (realizar) {
                case "btnEditar": {
                    //Captura de datos
                    id = Integer.parseInt(request.getParameter("txtId"));
                    dni = request.getParameter("txtdni");
                    nom = request.getParameter("txtnom");
                    ap = request.getParameter("txtap");
                    direc = request.getParameter("txtdirec");
                    em = request.getParameter("txtem");
                    pass = request.getParameter("txtpass");
                    tel = request.getParameter("txttel");
                    dis = request.getParameter("txtdis");
                    rol = Integer.parseInt(request.getParameter("txtrol"));
                    es = Integer.parseInt(request.getParameter("txtes"));
                    c = new Cliente(id, dni, nom, ap, direc, em, pass, tel, dis, rol, es);
                    res = cldao.modificarCliente(c);
                    if (res != 0) {
                        mensaje = "Registro Modificado";
                    }
                }
                break;
                case "btnEliminar": {
                    //Captura de datos
////                    id = Integer.parseInt(request.getParameter("txtId"));
////                    dni = request.getParameter("txtdni");
////                    nom = request.getParameter("txtnom");
////                    ap = request.getParameter("txtap");
////                    direc = request.getParameter("txtdirec");
////                    em = request.getParameter("txtem");
////                    pass = request.getParameter("txtpass");
////                    tel = request.getParameter("txttel");
////                    dis = request.getParameter("txtdis");
////                    rol = Integer.parseInt(request.getParameter("txtrol"));
////                    es = Integer.parseInt(request.getParameter("txtes"));
////                    c = new Cliente(id, dni, nom, ap, direc, em, pass, tel, dis, rol, es);
////                    res = cldao.eliminarCliente(c);
//                    if (res != 0) {
//                        mensaje = "Registro Eliminado";
//                    }
                }
                break;
                case "btnGuardar": {
//                    //Captura de datos
//                    dni = request.getParameter("txtdni");
//                    nom = request.getParameter("txtnom");
//                    ap = request.getParameter("txtap");
//                    direc = request.getParameter("txtdirec");
//                    em = request.getParameter("txtem");
//                    pass = request.getParameter("txtpass");
//                    tel = request.getParameter("txttel");
//                    dis = request.getParameter("txtdis");
//                    rol = Integer.parseInt(request.getParameter("txtrol"));
//                    es = Integer.parseInt(request.getParameter("txtes"));
//                    c = new Cliente();
//                    c.setDni(dni);
//                    c.setNombres(nom);
//                    c.setApellidos(ap);
//                    c.setDireccion(direc);
//                    c.setEmail(em);
//                    c.setPass(pass);
//                    c.setTelefono(tel);
//                    c.setDistrito(dis);
//                    c.setRol(rol);
//                    c.setEstado(es);
                    res = 1;
                    res = cldao.AgregarCliente(c);
                    if (res != 0) {
                        mensaje = "Registro Agregado";
                    }
                }
                break;
            }
            request.setAttribute("message", mensaje);
            request.setAttribute("clientes", cldao.listar());
            request.getRequestDispatcher("/VISTAS/mantenimientoDeClientes.jsp").forward(request, response);

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
