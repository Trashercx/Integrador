package com.ticketsystem.model;

import java.util.Date;

public class Compra {
    private int id;
    private int usuarioId;
    private int eventoId;
    private int cantidad;
    private Date fechaCompra;

    // Constructor
    public Compra(int id, int usuarioId, int eventoId, int cantidad, Date fechaCompra) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.eventoId = eventoId;
        this.cantidad = cantidad;
        this.fechaCompra = fechaCompra;
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUsuarioId() { return usuarioId; }
    public void setUsuarioId(int usuarioId) { this.usuarioId = usuarioId; }
    public int getEventoId() { return eventoId; }
    public void setEventoId(int eventoId) { this.eventoId = eventoId; }
    public int getCantidad() { return cantidad; }
    public void setCantidad(int cantidad) { this.cantidad = cantidad; }
    public Date getFechaCompra() { return fechaCompra; }
    public void setFechaCompra(Date fechaCompra) { this.fechaCompra = fechaCompra; }
}
