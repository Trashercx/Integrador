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
    <div class="min-h-screen flex items-center justify-center bg-gradient-to-r from-orange-500 to-orange-600 p-4">
  <div class="bg-card shadow-lg rounded-lg overflow-hidden w-full max-w-4xl">
    <div class="flex flex-col md:flex-row items-center p-6 bg-primary text-primary-foreground">
      <label for="upload-image" class="w-full md:w-1/2 h-48 rounded-lg border-2 border-white mb-4 md:mr-4 md:mb-0 flex items-center justify-center cursor-pointer">
        <img src="https://placehold.co/400x400?text=Evento" alt="Imagen del evento" class="w-48 h-48 md:w-96 md:h-48 rounded-lg">
        <input type="file" id="upload-image" class="hidden" accept="image/*">
      </label>
      <div class="w-full md:w-1/2 md:pl-4">
        <h1 class="text-3xl font-bold mb-2">Descripci�n del evento</h1>
        <p id="event-description" class="text-muted-foreground" contenteditable>��nete a nosotros en este evento especial donde celebraremos juntos la magia de la comunidad! Habr� sorpresas, actividades emocionantes y mucho m�s. �No te lo pierdas!</p>
      </div>
    </div>
    <div class="p-6 bg-card-foreground">
      <hr class="border-muted mb-4">
      <div class="flex justify-between">
        <button class="bg-secondary text-secondary-foreground hover:bg-secondary/80 py-2 px-4 rounded-lg font-semibold">PREVENTA</button>
        <button class="bg-accent text-accent-foreground hover:bg-accent/80 py-2 px-4 rounded-lg font-semibold">VENTA GENERAL</button>
      </div>
    </div>
  </div>
</div>

  </body>
</html>