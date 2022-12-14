package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.Mascota;
import es.KOKOVET.MODEL.MascotaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlMascota", urlPatterns = {"/ControlMascota"})
public class ControlMascota extends HttpServlet {

    String resp = "ERROR EN CARGADO";
    private MascotaDAO mascDAO = new MascotaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
        switch (accion.toLowerCase()) {
            case "nueva_mascota":
                NuevaMascota(request, response);
                break;
        }
    }

    protected void NuevaMascota(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Mascota m = new Mascota();
        m.setColor(request.getParameter("color").trim());
        m.setIdCliente(Integer.parseInt(request.getParameter("cliente").trim()));
        m.setSexo(request.getParameter("sexo").trim());
        m.setFechaNac(request.getParameter("nacimiento").trim());
        m.setNombre(request.getParameter("nombre").trim());
        m.setEspecie(request.getParameter("especie").trim());
        m.setRaza(request.getParameter("raza").trim());
        m.setFechaIngreso(request.getParameter("ingreso").trim());

        if (mascDAO.Guardar(m) > 0) {
            resp = "Los datos de la mascota se guardaron de forma correcta";
        } else {
            resp = "Los datos de la mascota no se pudieron guardar";
        }
        request.setAttribute("message", resp);
        request.getRequestDispatcher("VISTAS/PagNuevaMascota.jsp").forward(request, response);
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
