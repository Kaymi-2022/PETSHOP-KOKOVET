/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.KOKOVET.CONTROLADOR;

import es.KOKOVET.CONEXION.Fecha;
import es.KOKOVET.MODEL.Carrito;
import es.KOKOVET.MODEL.Cliente;
import es.KOKOVET.MODEL.ClienteDAO;
import es.KOKOVET.MODEL.Compra;
import es.KOKOVET.MODEL.ComprasDAO;
import es.KOKOVET.MODEL.DetalleCompra;
import es.KOKOVET.MODEL.Pago;
import es.KOKOVET.MODEL.ProductoDAO;
import es.KOKOVET.MODEL.Productos;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MICHAEL
 */
@MultipartConfig
@WebServlet(name = "ControladorCarrito", urlPatterns = {"/ControladorCarrito"})
public class ControladorCarrito extends HttpServlet {

    Pago pago = new Pago();
    Cliente cl = new Cliente();
    ClienteDAO cldao = new ClienteDAO();
    ComprasDAO cdao = new ComprasDAO();
    ProductoDAO pdao = new ProductoDAO();
    Productos p = new Productos();
    int item = 0;
    int cantidad = 1;
    double subtotal = 0.0;
    double totalPagar = 0.0;
    double costodeEnvio = 0.0;

    List<Carrito> listaProductos = new ArrayList<>();
    List productos = new ArrayList();

    List clientes = new ArrayList();

    List compras = new ArrayList();

    String logueo = "Iniciar Sesion";
    String correo = "Iniciar Sesion";
    int rol = 0;

    int idcompra;
    int idpago;
    double montopagar;
    int idProducto = 0;
    double tot;
    int res;

    String tipoenvio;

    Carrito car = new Carrito();

    Fecha fechaSistem = new Fecha();

    String mensaje = "Error";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("logueo", logueo);
        session.setAttribute("correo", correo);
        String accion = request.getParameter("accion");
        productos = pdao.listar();
        clientes = cldao.listar();
        compras = cdao.Compras();

        switch (accion) {
            //CASOS CARRITO DE COMPRA
            case "Nuevo":
                listaProductos = new ArrayList();
                request.getRequestDispatcher("ControladorCarrito?accion=home").forward(request, response);
                break;
            case "MisCompras":
                if (cl.getId() != 0) {
                    List compra = cdao.misCompras(cl.getId());
                    request.setAttribute("myCompras", compra);
                    request.getRequestDispatcher("VISTAS/compras.jsp").forward(request, response);
                } else if (listaProductos.size() > 0) {
                    request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("ControladorCarrito?accion=home").forward(request, response);
                }
                break;
            case "Salir":
                listaProductos = new ArrayList();
                cl = new Cliente();
                session.invalidate();
                logueo = "Iniciar Sesion";
                correo = "Iniciar Sesion";
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "GenerarCompra":
                idpago = cdao.IdPago();
                if (cl.getId() != 0 && listaProductos.size() != 0 && montopagar > 0) {
                    if (totalPagar > 0.0) {
                        Compra co = new Compra();
                        co.setIdCliente(cl.getId());
                        co.setFecha(fechaSistem.FechaBD());
                        co.setMonto(totalPagar);
                        co.setIdPago(idpago);
                        co.setEstado("Cancelado - En Proceso de Envio");
                        cdao.guardarCompra(co);
                        montopagar = 0;

                        idcompra = cdao.IdCompra();
                        for (int i = 0; i < listaProductos.size(); i++) {
                            DetalleCompra dc = new DetalleCompra();
                            dc.setIdcompra(idcompra);
                            dc.setIdproducto(listaProductos.get(i).getIdProducto());
                            dc.setCantidad(listaProductos.get(i).getCantidad());
                            dc.setPrecioCompra(listaProductos.get(i).getPrecioCompra());
                            cdao.guardarDetalleCompra(dc);
                        }
                        listaProductos = new ArrayList<>();
                        List compra = cdao.misCompras(cl.getId());
                        request.setAttribute("myCompras", compra);
                        request.getRequestDispatcher("VISTAS/compras.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("ControladorCarrito?accion=home").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                }
                break;
            case "Validar":
                String email = request.getParameter("txtemail");
                String pass = request.getParameter("txtpass");
                cl = cldao.Validar(email, pass);
                if (cl.getId() != 0) {
                    logueo = cl.getNombres();
                    correo = cl.getEmail();
                    rol = cl.getRol();
                    switch (rol) {
                        case 1:
                            mensaje = "BIENVENIDO ADMINISTRADOR " + logueo;
                            productos = pdao.listar();
                            request.setAttribute("message", mensaje);
                            request.setAttribute("productos", productos);
                            request.getRequestDispatcher("VISTAS/indexAdmin.jsp").forward(request, response);
                            break;
                        case 2:
                            mensaje = "BIENVENIDO DOCTOR (A) " + logueo;
                            request.setAttribute("message", mensaje);
                            request.getRequestDispatcher("VISTAS/PagAnexo.jsp").forward(request, response);
                            break;
                        default:
                            mensaje = "LE DAMOS LA BIENVENIDA " + logueo;
                            request.setAttribute("message", mensaje);
                            request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                    }

                } else {
                    mensaje = "ERROR DE DATOS VUELVA A INGRESAR";
                    request.setAttribute("message", mensaje);
                    request.getRequestDispatcher("VISTAS/Login.jsp").forward(request, response);
                }
                break;
            case "Registrar":
                String dni = request.getParameter("txtdni");
                String nom = request.getParameter("txtnom");
                String apellidos = request.getParameter("txtapellidos");
                String direccion = request.getParameter("txtdire");
                String em = request.getParameter("txtemail");
                String pas = request.getParameter("txtpass");
                String telefono = request.getParameter("txttel");
                String distrito = request.getParameter("txtdistrito");
                cl.setDni(dni);
                cl.setNombres(nom);
                cl.setApellidos(apellidos);
                cl.setDireccion(direccion);
                cl.setEmail(em);
                cl.setPass(pas);
                cl.setTelefono(telefono);
                cl.setDistrito(distrito);
                cldao.AgregarCliente(cl);
                request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                break;
            case "RealizarPago":
                montopagar = Double.parseDouble(request.getParameter("txtmonto"));
                if (cl.getId() != 0 && montopagar > 0) {
                    cdao.Pagar(montopagar);
                    request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                } else {
                    montopagar = 0;
                    request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                }
                break;
            case "carrito":
                totalPagar = 0.0;
                item = 0;
                tot = 0.0;
                request.setAttribute("Carrito", listaProductos);
                request.setAttribute("productos", productos);
                for (int i = 0; i < listaProductos.size(); i++) {
                    totalPagar = totalPagar + listaProductos.get(i).getSubTotal();
                    listaProductos.get(i).setItem(item + i + 1);
                }
                tot = totalPagar + costodeEnvio;
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("precioEnvio", costodeEnvio);
                request.setAttribute("total", tot);
                request.getRequestDispatcher("VISTAS/carrito.jsp").forward(request, response);
                break;
            case "verDetalle":
                totalPagar = 0.0;
                int idcompras = Integer.parseInt(request.getParameter("idCompras"));
                List<DetalleCompra> detalle = cdao.Detalle(idcompras);
                request.setAttribute("myDetalle", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalPagar = totalPagar + (detalle.get(i).getPrecioCompra() * detalle.get(i).getCantidad());
                }
                request.setAttribute("montoPagar", totalPagar);
                request.getRequestDispatcher("VISTAS/DetalleCompra.jsp").forward(request, response);
                break;
            case "Buscar":
                String nombre = request.getParameter("txtbuscar");
                productos = pdao.buscar(nombre);
                request.setAttribute("cont", listaProductos.size());
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("VISTAS/Productos.jsp").forward(request, response);
                break;
            case "AgregarCarrito":
                agregarCarrito(request);
                request.setAttribute("cont", listaProductos.size());
                request.getRequestDispatcher("ControladorCarrito?accion=home").forward(request, response);
                break;
            case "Comprar":
                agregarCarrito(request);
                request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                break;
            case "updateCantidad":
                idProducto = Integer.parseInt(request.getParameter("id"));
                int cant = Integer.parseInt(request.getParameter("cantidad"));
                for (int j = 0; j < listaProductos.size(); j++) {
                    if (listaProductos.get(j).getIdProducto() == idProducto) {
                        listaProductos.get(j).setCantidad(cant);
                        double totalPago = Math.round(listaProductos.get(j).getPrecioCompra() * cant);
                        listaProductos.get(j).setSubTotal(totalPago);
                    }
                }
                break;
            case "deleteProducto":
                idProducto = Integer.parseInt(request.getParameter("idp"));
                if (listaProductos != null) {
                    for (int j = 0; j < listaProductos.size(); j++) {
                        if (listaProductos.get(j).getIdProducto() == idProducto) {
                            listaProductos.remove(j);
                        }
                    }
                }
                break;
            case "metodoEnvio1":
                Double total;
                costodeEnvio = 0.0;
                total = totalPagar + costodeEnvio;
                request.setAttribute("Carrito", listaProductos);
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("precioEnvio", costodeEnvio);
                request.setAttribute("total", total);

                request.getRequestDispatcher("VISTAS/carrito.jsp").forward(request, response);
                break;
            case "metodoEnvio2":
                costodeEnvio = 15.0;
                double t = totalPagar + costodeEnvio;
                request.setAttribute("Carrito", listaProductos);
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("precioEnvio", costodeEnvio);
                request.setAttribute("total", t);
                request.getRequestDispatcher("VISTAS/carrito.jsp").forward(request, response);
                break;
            case "Envio":
                request.getRequestDispatcher("VISTAS/Envio.jsp").forward(request, response);
                break;
            case "borrarProducto":
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("VISTAS/indexAdmin.jsp").forward(request, response);
                break;
            case "consultasClientes":
                request.getRequestDispatcher("VISTAS/consultaResponder.jsp").forward(request, response);
                break;
            case "Login":
                request.getRequestDispatcher("VISTAS/Login.jsp").forward(request, response);
                break;
            case "mantenimientoCliente":
                request.setAttribute("clientes", clientes);
                request.getRequestDispatcher("VISTAS/mantenimientoDeClientes.jsp").forward(request, response);
                break;
            case "mantenimientoPedido":
                request.setAttribute("compras", compras);
                request.getRequestDispatcher("VISTAS/estadoDePedido.jsp").forward(request, response);
                break;
            case "modificarCliente":
                request.setAttribute("compras", compras);
                request.getRequestDispatcher("VISTAS/estadoDePedido.jsp").forward(request, response);
                break;
            case "indexAdmin":
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("VISTAS/indexAdmin.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("VISTAS/Productos.jsp").forward(request, response);
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

    public void agregarCarrito(HttpServletRequest request) {
        cantidad = 1;
        int pos = 0;
        int idp = Integer.parseInt(request.getParameter("id"));
        if (listaProductos.size() > 0) {
            for (int i = 0; i < listaProductos.size(); i++) {
                if (listaProductos.get(i).getIdProducto() == idp) {
                    pos = i;
                }
            }
            if (idp == listaProductos.get(pos).getIdProducto()) {
                cantidad = listaProductos.get(pos).getCantidad() + cantidad;
                subtotal = listaProductos.get(pos).getPrecioCompra() * cantidad;
                listaProductos.get(pos).setCantidad(cantidad);
                listaProductos.get(pos).setSubTotal(subtotal);
            } else {
                car = new Carrito();
                p = pdao.listaId(idp);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setImagen(p.getFoto());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                subtotal = cantidad * p.getPrecio();
                car.setSubTotal(subtotal);
                car.setStock(p.getStock());
                listaProductos.add(car);
            }
        } else {
            car = new Carrito();
            p = pdao.listaId(idp);
            car.setIdProducto(p.getId());
            car.setNombres(p.getNombres());
            car.setImagen(p.getFoto());
            car.setDescripcion(p.getDescripcion());
            car.setPrecioCompra(p.getPrecio());
            car.setCantidad(cantidad);
            subtotal = cantidad * p.getPrecio();
            car.setSubTotal(subtotal);
            car.setStock(p.getStock());
            listaProductos.add(car);
        }
    }
}
