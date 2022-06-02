package vistas_clases;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionDB {

    public static Connection getConnection() {

        //CODIGO PARA TRABAJAR CON ORACLE   
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost/datamartcolegio"; //anime is the database
        String username = "root"; //leave blank if none
        String password = "mysql123"; //leave blank if none

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
