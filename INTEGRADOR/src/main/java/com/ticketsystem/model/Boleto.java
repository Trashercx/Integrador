package com.ticketsystem.model;

public class Boleto {
    private int id;
    private int compraId;
    private int eventoId;
    private int cantidad;

    // Constructor
    public Boleto(int id, int compraId, int eventoId, int cantidad) {
        this.id = id;
        this.compraId = compraId;
        this.eventoId = eventoId;
        this.cantidad = cantidad;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getCompraId() { return compraId; }
    public void setCompraId(int compraId) { this.compraId = compraId; }
    public int getEventoId() { return eventoId; }
    public void setEventoId(int eventoId) { this.eventoId = eventoId; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
}
