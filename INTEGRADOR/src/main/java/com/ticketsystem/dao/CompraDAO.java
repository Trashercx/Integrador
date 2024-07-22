package com.ticketsystem.dao;

import com.ticketsystem.model.Compra;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CompraDAO {
    private Connection connection;

    public CompraDAO(Connection connection) {
        this.connection = connection;
    }

    public void registrarCompra(Compra compra) throws SQLException {
        String query = "INSERT INTO compras (usuario_id, evento_id, cantidad, fecha_compra) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, compra.getUsuarioId());
            pstmt.setInt(2, compra.getEventoId());
            pstmt.setInt(3, compra.getCantidad());
            pstmt.setDate(4, new java.sql.Date(compra.getFechaCompra().getTime()));
            pstmt.executeUpdate();
        }
    }

    public Compra obtenerCompraPorId(int id) throws SQLException {
        String query = "SELECT * FROM compras WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Compra(
                        rs.getInt("id"),
                        rs.getInt("usuario_id"),
                        rs.getInt("evento_id"),
                        rs.getInt("cantidad"),
                        rs.getDate("fecha_compra")
                    );
                }
            }
        }
        return null;
    }

    public List<Compra> listarCompras() throws SQLException {
        List<Compra> compras = new ArrayList<>();
        String query = "SELECT * FROM compras";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                compras.add(new Compra(
                    rs.getInt("id"),
                    rs.getInt("usuario_id"),
                    rs.getInt("evento_id"),
                    rs.getInt("cantidad"),
                    rs.getDate("fecha_compra")
                ));
            }
        }
        return compras;
    }
}
