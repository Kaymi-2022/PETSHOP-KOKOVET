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
public class ClienteDAO {

    Connection con;
    ConexionBD conexion = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;

    public List ListarClientes() {
        List<Cliente> listclientes = new ArrayList<>();
        String sql = "SELECT * FROM CLIENTE";
        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt(1));
                c.setDNI(rs.getString(2));
                c.setNombre(rs.getString(3));
                c.setApellidos(rs.getString(4));
                c.setTelefono(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setPassword(rs.getString(7));
                c.setDepartamento(rs.getString(8));
                c.setDistrito(rs.getString(9));
                c.setDireccion(rs.getString(10));
                c.setFoto(rs.getBinaryStream(11));
                listclientes.add(c);
            }
        } catch (Exception e) {

        }

        return listclientes;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "SELECT * FROM CLIENTE WHERE idCliente="+id;
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
                inputStream = rs.getBinaryStream("Foto");
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

    public void AgregarClientes(Cliente clientes) {
        String sql = "INSERT INTO cliente(idcliente,Dni, Nombres, apellidoCliente, telefono, Email, Password, departamento, distrito, Direccion, Foto)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
//        String sql = "INSERT INTO CLIENTE VALUES(?,?,?,?,?,?,?,?,?,?,?)";

        try {
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, clientes.getId());
            ps.setString(2, clientes.getDNI());
            ps.setString(3, clientes.getNombre());
            ps.setString(4, clientes.getApellidos());
            ps.setString(5, clientes.getTelefono());
            ps.setString(6, clientes.getEmail());
            ps.setString(7, clientes.getPassword());
            ps.setString(8, clientes.getDepartamento());
            ps.setString(9, clientes.getDistrito());
            ps.setString(10, clientes.getDireccion());
            ps.setBinaryStream(11, clientes.getFoto());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("ERROR EN REGISTRO "+e.getMessage());
        }

    }
    


}
