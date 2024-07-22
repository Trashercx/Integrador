<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ticketsystem.model.Evento, java.util.ArrayList, java.util.List, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <script src="https://unpkg.com/unlazy@0.11.3/dist/unlazy.with-hashing.iife.js" defer init></script>
    <script type="text/javascript">
        window.tailwind.config = {
            darkMode: ['class'],
            theme: {
                extend: {
                    colors: {
                        border: 'hsl(var(--border))',
                        input: 'hsl(var(--input))',
                        ring: 'hsl(var(--ring))',
                        background: 'hsl(var(--background))',
                        foreground: 'hsl(var(--foreground))',
                        primary: {
                            DEFAULT: 'hsl(var(--primary))',
                            foreground: 'hsl(var(--primary-foreground))'
                        },
                        secondary: {
                            DEFAULT: 'hsl(var(--secondary))',
                            foreground: 'hsl(var(--secondary-foreground))'
                        },
                        destructive: {
                            DEFAULT: 'hsl(var(--destructive))',
                            foreground: 'hsl(var(--destructive-foreground))'
                        },
                        muted: {
                            DEFAULT: 'hsl(var(--muted))',
                            foreground: 'hsl(var(--muted-foreground))'
                        },
                        accent: {
                            DEFAULT: 'hsl(var(--accent))',
                            foreground: 'hsl(var(--accent-foreground))'
                        },
                        popover: {
                            DEFAULT: 'hsl(var(--popover))',
                            foreground: 'hsl(var(--popover-foreground))'
                        },
                        card: {
                            DEFAULT: 'hsl(var(--card))',
                            foreground: 'hsl(var(--card-foreground))'
                        },
                    },
                }
            }
        }
    </script>
    <style type="text/tailwindcss">
        @layer base {
            :root {
                --background: 0 0% 100%;
                --foreground: 20 14.3% 4.1%;
                --card: 0 0% 100%;
                --card-foreground: 20 14.3% 4.1%;
                --popover: 0 0% 100%;
                --popover-foreground: 20 14.3% 4.1%;
                --primary: 24.6 95% 53.1%;
                --primary-foreground: 60 9.1% 97.8%;
                --secondary: 60 4.8% 95.9%;
                --secondary-foreground: 24 9.8% 10%;
                --muted: 60 4.8% 95.9%;
                --muted-foreground: 25 5.3% 44.7%;
                --accent: 60 4.8% 95.9%;
                --accent-foreground: 24 9.8% 10%;
                --destructive: 0 84.2% 60.2%;
                --destructive-foreground: 60 9.1% 97.8%;
                --border: 20 5.9% 90%;
                --input: 20 5.9% 90%;
                --ring: 24.6 95% 53.1%;
                --radius: 0.95rem;
            }
            .dark {
                --background: 20 14.3% 4.1%;
                --foreground: 60 9.1% 97.8%;
                --card: 20 14.3% 4.1%;
                --card-foreground: 60 9.1% 97.8%;
                --popover: 20 14.3% 4.1%;
                --popover-foreground: 60 9.1% 97.8%;
                --primary: 20.5 90.2% 48.2%;
                --primary-foreground: 60 9.1% 97.8%;
                --secondary: 12 6.5% 15.1%;
                --secondary-foreground: 60 9.1% 97.8%;
                --muted: 12 6.5% 15.1%;
                --muted-foreground: 24 5.4% 63.9%;
                --accent: 12 6.5% 15.1%;
                --accent-foreground: 60 9.1% 97.8%;
                --destructive: 0 72.2% 50.6%;
                --destructive-foreground: 60 9.1% 97.8%;
                --border: 12 6.5% 15.1%;
                --input: 12 6.5% 15.1%;
                --ring: 20.5 90.2% 48.2%;
            }
        }
    </style>
</head>
<body>
<div class="min-h-screen bg-background text-foreground flex flex-col items-center py-8">
    <h1 class="text-4xl font-bold mb-8">Catálogo</h1>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        <%
            List<Evento> eventos = new ArrayList<>();
            eventos.add(new Evento(1, "Concierto de Rock", "Un emocionante concierto de rock.", new Date(), 50.0, 100, "https://placehold.co/200x200"));
            eventos.add(new Evento(2, "Teatro Clásico", "Una obra de teatro clásica imperdible.", new Date(), 30.0, 50, "https://placehold.co/200x200"));
            eventos.add(new Evento(3, "Feria de Libros", "Una feria con una gran selección de libros.", new Date(), 10.0, 200, "https://placehold.co/200x200"));
            
            for (Evento evento : eventos) {
        %>
        <div class="bg-card p-4 rounded-lg shadow-lg flex flex-col items-center">
            <img src="<%= evento.getImagen() %>" alt="<%= evento.getNombre() %>" class="w-full h-auto mb-4 rounded-lg" />
            <h2 class="text-2xl font-bold mb-2"><%= evento.getNombre() %></h2>
            <p class="text-muted mb-4"><%= evento.getDescripcion() %></p>
            <a href="detalle_evento?eventoId=<%= evento.getId() %>" class="bg-primary text-primary-foreground hover:bg-primary/80 py-2 px-4 rounded-lg">Ver Detalles</a>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
