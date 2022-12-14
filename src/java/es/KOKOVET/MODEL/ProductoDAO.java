/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package es.KOKOVET.MODEL;

import es.KOKOVET.CONEXION.ConexionBD;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MICHAEL
 */
public class ProductoDAO {

    Connection con;
    ConexionBD conexion = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public List listar() {
        List<Productos> productos = new ArrayList<>();
        String sql = "select * from producto";

        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos p = new Productos();
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                productos.add(p);
            }
        } catch (Exception e) {

        }

        return productos;
    }

    public Productos listaId(int id) {
        String sql = "SELECT * FROM producto WHERE idProducto=" + id;
        Productos p = new Productos();
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return p;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from producto where idProducto=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("foto");
            } else {
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (IOException | SQLException e) {

        }
    }

    public int actualizarPedido(String estado, int id) {
        int respuesta = 0;
        String mensaje;
        String sql = "UPDATE `compras` SET `Estado` = ? WHERE `compras`.`idCompras` =?";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            ps.setInt(2, id);
            respuesta = ps.executeUpdate();

        } catch (Exception e) {
        }
        return respuesta;
    }

    public List buscar(String nombre) {
        Productos p = new Productos();
        List list = new ArrayList();
        String sql = "select * from producto where Nombres like '%?%'";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int AgregarNuevoProducto(Productos p) {
        int respuesta = 0;
        String sql = "INSERT INTO producto (Nombres, Foto, Descripcion, Precio, Stock) VALUES (?, ?, ?, ?, ?)";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombres());
            ps.setBlob(2, p.getFoto());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getStock());
            respuesta = ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
            }
        }
        return respuesta;
    }

    public int actualizarProducto(Productos p) {

        int resp = 0;
        String sql = "UPDATE producto SET Nombres = ?,Foto=?, Descripcion = ?, Precio = ?, Stock = ? WHERE producto.idProducto = ?";

        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombres());
            ps.setBinaryStream(2, p.getFoto());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getStock());
            ps.setInt(6, p.getId());
            resp = ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
            }
        }
        return resp;
    }

    public int eliminarProducto(Productos p) {
        int res = 0;
        String sql = "DELETE FROM producto WHERE idProducto=?";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, p.getId());
            res = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            try {
                con.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return res;
    }

}
