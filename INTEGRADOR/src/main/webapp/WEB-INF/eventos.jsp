<%@ page import="java.util.List" %>
<%@ page import="com.ticketsystem.model.Evento" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Eventos</title>
</head>
<body>
    <h1>Catálogo de Eventos</h1>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Fecha</th>
            <th>Descripción</th>
            <th>Precio</th>
        </tr>
        <%
            List<Evento> eventos = (List<Evento>) request.getAttribute("eventos");
            if (eventos != null) {
                for (Evento evento : eventos) {
        %>
            <tr>
                <td><%= evento.getId() %></td>
                <td><%= evento.getNombre() %></td>
                <td><%= evento.getFecha() %></td>
                <td><%= evento.getDescripcion() %></td>
                <td><%= evento.getPrecio() %></td>
            </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
