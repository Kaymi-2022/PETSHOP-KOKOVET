package es.KOKOVET.MODEL;

import es.KOKOVET.CONEXION.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    Connection con;
    ConexionBD cn = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;

    public List listar() {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "select * from cliente";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombres(rs.getString(3));
                c.setApellidos(rs.getString(4));
                c.setDireccion(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setPass(rs.getString(7));
                c.setTelefono(rs.getString(8));
                c.setDistrito(rs.getString(9));
                c.setRol(rs.getInt(10));
                c.setEstado(rs.getInt(11));
                clientes.add(c);
            }
        } catch (Exception e) {

        }

        return clientes;
    }

    public Cliente Validar(String email, String pass) {
        String sql = "select * from cliente where Email=? and Password=? and Estado=" + 1;
        Cliente c = new Cliente();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombres(rs.getString(3));
                c.setApellidos(rs.getString(4));
                c.setDireccion(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setPass(rs.getString(7));
                c.setTelefono(rs.getString(8));
                c.setDistrito(rs.getString(9));
                c.setRol(rs.getInt(10));
                c.setEstado(rs.getInt(11));
            }
        } catch (Exception e) {
        }
        return c;
    }

    public int AgregarCliente(Cliente c) {
        String sql = "INSERT INTO cliente (Dni, Nombres,Apellidos,Direccion,Email,"
                + "Password,Telefono,Distrito)values(?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombres());
            ps.setString(3, c.getApellidos());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getPass());
            ps.setString(7, c.getTelefono());
            ps.setString(8, c.getDistrito());
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
            }
        }
        return 1;
    }

    public int modificarCliente(Cliente c) {
        int res = 0;
        String sql = "UPDATE cliente SET Dni=?,Nombres=?,Apellidos=?,Direccion=?,Email=?,Password=?,Telefono=?,Distrito=?,Rol=?,Estado=? WHERE cliente.idCliente=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombres());
            ps.setString(3, c.getApellidos());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getEmail());
            ps.setString(6, c.getPass());
            ps.setString(7, c.getTelefono());
            ps.setString(8, c.getDistrito());
            ps.setInt(9, c.getRol());
            ps.setInt(10, c.getEstado());
            ps.setInt(11, c.getId());
            res = ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
            }
        }
        return res;
    }

    public int eliminarCliente(Cliente c) {
        int rs = 0;
        String sql = "DELETE FROM cliente WHERE idCliente=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, c.getId());
            rs = ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                con.close();
                ps.close();
            } catch (Exception e) {
            }
        }
        return rs;
    }

    public ArrayList<Cliente> ListarTodos() {
        ArrayList<Cliente> lista = new ArrayList<>();

        try {
            String sql = "select * from Cliente where Rol=3 order by apellidos asc";
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("idCliente"));
                c.setNombres(rs.getString("nombres"));
                c.setApellidos(rs.getString("apellidos"));
                lista.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ex) {
            }
        }
        return lista;
    }
}
