package com.ticketsystem.servlet;

import com.ticketsystem.dao.PersonaDAO;
import com.ticketsystem.model.Persona;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/registro.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");

        // Crear una nueva instancia de Persona
        Persona persona = new Persona();
        persona.setNombre(nombre);
        persona.setApellidos(apellidos);
        persona.setCorreo(correo);
        persona.setTelefono(telefono);
        persona.setContrasena(contrasena);

        // Usar PersonaDAO para guardar la nueva persona en la base de datos
        PersonaDAO personaDAO = new PersonaDAO();
        personaDAO.save(persona);

        // Redirigir a una página de éxito
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/registro_exitoso.jsp");
        dispatcher.forward(request, response);
    }
}
