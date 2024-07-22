package com.ticketsystem.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestJDBCConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/integra";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    static {
        try {
            // Cargar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("No se pudo cargar el driver JDBC", e);
        }
    }

    // Método para obtener una conexión a la base de datos
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
