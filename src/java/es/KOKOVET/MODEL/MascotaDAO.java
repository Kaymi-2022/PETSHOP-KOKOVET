package es.KOKOVET.MODEL;

import es.KOKOVET.CONEXION.ConexionBD;
import java.sql.*;
import java.util.ArrayList;

public class MascotaDAO {

    Connection con;
    ConexionBD conexion = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;

    public int Guardar(Mascota obj) {
        int res = 0;
        try {
            String sql = "insert into Mascota(idCliente,color,sexo,fechaNac,nombre,especie,raza,fechaIngreso) "
                    + " values(?,?,?,?,?,?,?,?)";
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, obj.getIdCliente());
            ps.setString(2, obj.getColor());
            ps.setString(3, obj.getSexo());
            ps.setString(4, obj.getFechaNac());
            ps.setString(5, obj.getNombre());
            ps.setString(6, obj.getEspecie());
            ps.setString(7, obj.getRaza());
            ps.setString(8, obj.getFechaIngreso());
            res = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
            }
        }
        return res;
    }

    public ArrayList<Mascota> ListarTodos() {
        ArrayList<Mascota> lista = new ArrayList<>();

        try {
            String sql = "select * from Mascota order by nombre asc";
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mascota c = new Mascota();
                c.setIdMascota(rs.getInt("idMascota"));
                c.setNombre(rs.getString("nombre"));
                lista.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
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

    public Mascota BuscarDatosAtencion(int nroAtencion) {
        Mascota c = null;
        try {
            String sql = "select * from AtencionMascota a inner join Mascota m\n"
                    + "on m.idMascota = a.idMascota\n"
                    + "inner join Cliente c on c.idCliente = m.idCliente"
                    + "  where idAtencion=?";
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, nroAtencion);
            rs = ps.executeQuery();
            if (rs.next()) {
                c = new Mascota();
                c.setIdMascota(rs.getInt("idMascota"));
                c.setNombre(rs.getString("nombre"));
                c.setCliente(rs.getString("nombres") + " " + rs.getString("apellidos"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
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
        return c;
    }
}
