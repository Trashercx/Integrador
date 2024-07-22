: <!DOCTYPE html>
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
    <div class="p-6 max-w-md mx-auto bg-card rounded-xl shadow-md space-y-6">
        <h1 class="text-3xl font-bold text-primary">Registro</h1>
        <form class="space-y-4" action="registro" method="post">
            <div class="flex items-center space-x-4">
                <label for="nombre" class="flex-1 text-lg font-bold text-foreground">Nombre del estudiante</label>
                <input id="nombre" name="nombre" type="text" class="flex-1 bg-input h-10 rounded-md border border-border focus:ring-2 focus:ring-primary focus:outline-none px-2" />
            </div>
            <div class="flex items-center space-x-4">
                <label for="apellido" class="flex-1 text-lg font-bold text-foreground">Apellido del estudiante</label>
                <input id="apellido" name="apellido" type="text" class="flex-1 bg-input h-10 rounded-md border border-border focus:ring-2 focus:ring-primary focus:outline-none px-2" />
            </div>
            <div class="flex items-center space-x-4">
                <label for="correo" class="flex-1 text-lg font-bold text-foreground">Correo</label>
                <input id="correo" name="correo" type="email" class="flex-1 bg-input h-10 rounded-md border border-border focus:ring-2 focus:ring-primary focus:outline-none px-2" />
            </div>
            <div class="flex items-center space-x-4">
                <label for="telefono" class="flex-1 text-lg font-bold text-foreground">Número de teléfono</label>
                <input id="telefono" name="telefono" type="tel" class="flex-1 bg-input h-10 rounded-md border border-border focus:ring-2 focus:ring-primary focus:outline-none px-2" />
            </div>
            <div class="flex justify-end">
                <button type="submit" class="bg-primary text-primary-foreground hover:bg-primary/80 px-4 py-2 rounded-md">Enviar</button>
            </div>
        </form>
    </div>
</body>
</html>