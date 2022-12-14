/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package es.KOKOVET.CONEXION;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MICHAEL
 */
public class ConexionBD {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/petshop";
    public String user = "KOKOVET";
    public String pass = "123456";

    public Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(System.err);
        }
        return con;

    }   
}
