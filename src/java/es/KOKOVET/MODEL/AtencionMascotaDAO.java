package es.KOKOVET.MODEL;

import es.KOKOVET.CONEXION.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AtencionMascotaDAO {

    Connection con;
    ConexionBD conexion = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;

    public int Guardar(AtencionMascota obj) {
        int res = 0;
        try {

            String sql = "insert into AtencionMascota(idMascota,temperatura,fechaAtencion,motivo,altura,hora,estado,diagnostico,descripcion) "
                    + " values(?,?,?,?,?,?,?,?,?)";
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, obj.getIdMascota());
            ps.setDouble(2, obj.getTemperatura());
            ps.setString(3, obj.getFechaAtencion());
            ps.setString(4, obj.getMotivo());
            ps.setDouble(5, obj.getAltura());
            ps.setString(6, obj.getHora());
            ps.setString(7, obj.getEstado());
            ps.setString(8, obj.getDiagnostico());
            ps.setString(9, obj.getDescripcion());
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

    public int GenerarFicha(FichaMascota obj) {
        int res = 0;
        try {
            String sql = "insert into FichaMascota(idAtencion,receta,indicaciones) values(?,?,?)";
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, obj.getIdAtencion());
            ps.setString(2, obj.getReceta());
            ps.setString(3, obj.getIndicaciones());
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
}
