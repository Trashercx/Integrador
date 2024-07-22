package com.ticketsystem.dao;

import com.ticketsystem.model.Boleto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoletoDAO {
    private Connection connection;

    public BoletoDAO(Connection connection) {
        this.connection = connection;
    }

    public void registrarBoleto(Boleto boleto) throws SQLException {
        String query = "INSERT INTO boletos (compra_id, evento_id, cantidad) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, boleto.getCompraId());
            pstmt.setInt(2, boleto.getEventoId());
            pstmt.setInt(3, boleto.getCantidad());
            pstmt.executeUpdate();
        }
    }

    public Boleto obtenerBoletoPorId(int id) throws SQLException {
        String query = "SELECT * FROM boletos WHERE id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Boleto(
                        rs.getInt("id"),
                        rs.getInt("compra_id"),
                        rs.getInt("evento_id"),
                        rs.getInt("cantidad")
                    );
                }
            }
        }
        return null;
    }

    public List<Boleto> listarBoletos() throws SQLException {
        List<Boleto> boletos = new ArrayList<>();
        String query = "SELECT * FROM boletos";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                boletos.add(new Boleto(
                    rs.getInt("id"),
                    rs.getInt("compra_id"),
                    rs.getInt("evento_id"),
                    rs.getInt("cantidad")
                ));
            }
        }
        return boletos;
    }
}
