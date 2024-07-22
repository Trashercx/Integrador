package com.ticketsystem.dao;

import com.ticketsystem.model.Evento;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EventoDAO {
    private Connection connection;

    public EventoDAO(Connection connection) {
        this.connection = connection;
    }

    public EventoDAO() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void agregarEvento(Evento evento) throws SQLException {
        String query = "INSERT INTO eventos (nombre, descripcion, fecha, precio, cantidad, imagen) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, evento.getNombre());
            pstmt.setString(2, evento.getDescripcion());
            pstmt.setDate(3, new java.sql.Date(evento.getFecha().getTime()));
            pstmt.setDouble(4, evento.getPrecio());
            pstmt.setInt(5, evento.getCantidad());
            pstmt.setString(6, evento.getImagen());
            pstmt.executeUpdate();
        }
    }

    public Evento obtenerEventoPorId(int id) throws SQLException {
        String query = "SELECT * FROM eventos WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Evento(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getDate("fecha"),
                        rs.getDouble("precio"),
                        rs.getInt("cantidad"),
                        rs.getString("imagen")
                    );
                }
            }
        }
        return null;
    }

    public List<Evento> listarEventos() throws SQLException {
        List<Evento> eventos = new ArrayList<>();
        String query = "SELECT * FROM eventos";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                eventos.add(new Evento(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("descripcion"),
                    rs.getDate("fecha"),
                    rs.getDouble("precio"),
                    rs.getInt("cantidad"),
                    rs.getString("imagen")
                ));
            }
        }
        return eventos;
    }

    public List<Evento> obtenerTodos() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
