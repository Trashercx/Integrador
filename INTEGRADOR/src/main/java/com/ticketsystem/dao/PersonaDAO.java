package com.ticketsystem.dao;

import com.ticketsystem.model.Persona;
import com.ticketsystem.test.TestJDBCConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PersonaDAO {

    // Método para guardar una nueva persona en la base de datos
    public void save(Persona persona) {
        String sql = "INSERT INTO persona (Nombre, Apellidos, Correo, Telefono, Contraseña) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = TestJDBCConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, persona.getNombre());
            statement.setString(2, persona.getApellidos());
            statement.setString(3, persona.getCorreo());
            statement.setString(4, persona.getTelefono());
            statement.setString(5, persona.getContrasena());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Persona guardada correctamente.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al guardar persona: " + e.getMessage());
        }
    }
}
