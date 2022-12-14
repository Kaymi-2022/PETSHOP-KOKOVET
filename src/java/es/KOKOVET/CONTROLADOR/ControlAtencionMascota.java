package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.MODEL.AtencionMascota;
import es.KOKOVET.MODEL.AtencionMascotaDAO;
import es.KOKOVET.MODEL.FichaMascota;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControlAtencionMascota", urlPatterns = {"/ControlAtencionMascota"})
public class ControlAtencionMascota extends HttpServlet {

    String resp = "ERROR EN CARGADO";
    private AtencionMascotaDAO atenMascDAO = new AtencionMascotaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
        switch (accion.toLowerCase()) {
            case "nueva_atencion":
                NuevaAtencion(request, response);
                break;
            case "generar_ficha":
                GenerarFicha(request, response);
                break;
        }
    }

    protected void GenerarFicha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        FichaMascota m = new FichaMascota();
        m.setIdAtencion(Integer.parseInt(request.getParameter("idAtencion").trim()));
        m.setIndicaciones(request.getParameter("indicaciones").trim());
        m.setReceta(request.getParameter("receta").trim());

        if (m.getIdAtencion() > 0) {
            if (atenMascDAO.GenerarFicha(m) > 0) {
                resp = "La ficha de la mascota se genero de forma correcta";
            } else {
                resp = "Los datos de la fihca no se pudieron guardar";
                request.setAttribute("message", resp);
            }
        } else {
            resp = "Debe ingresar un nro de atención a consultar";
        }
        request.setAttribute("message", resp);
        request.getRequestDispatcher("VISTAS/PagAnexo.jsp").forward(request, response);
    }

    protected void NuevaAtencion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AtencionMascota m = new AtencionMascota();
        m.setIdMascota(Integer.parseInt(request.getParameter("mascota").trim()));
        m.setTemperatura(Double.parseDouble(request.getParameter("temperatura").trim()));
        m.setFechaAtencion(request.getParameter("fechaAtencion").trim());
        m.setMotivo(request.getParameter("motivo").trim());
        m.setAltura(Double.parseDouble(request.getParameter("altura").trim()));
        m.setHora(request.getParameter("hora").trim());
        m.setEstado(request.getParameter("estado").trim());
        m.setDiagnostico(request.getParameter("diagnostico").trim());
        m.setDescripcion(request.getParameter("descripcion").trim());

        if (atenMascDAO.Guardar(m) > 0) {
            resp = "Los datos se guardaron de forma correcta";
        } else {
            resp = "Los datos no se pudieron guardar";
        }
        request.setAttribute("message", resp);
        request.getRequestDispatcher("VISTAS/PagRegistroAtencion.jsp").forward(request, response);
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
