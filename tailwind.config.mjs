/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      "./src/**/*.{astro,html,js,jsx,ts,tsx,vue,svelte}", 
      // 👆 Le dice a Tailwind dónde buscar clases para generar el CSS.
      // Aquí escanea todos los archivos relevantes en /src.
    ],
    theme: {
      extend: {
        // 🔧 Aquí puedes extender el diseño sin sobrescribir el original.
        colors: {
          brand: "#1e40af", // 🎨 Color personalizado llamado "brand"
        },
        fontFamily: {
          sans: ["Inter", "sans-serif"], // 🅰️ Fuente personalizada
        },
      },
    },
    darkMode: 'class',
    // 🌙 Usa clases (ej. <html class="dark">) para habilitar el modo oscuro.
    
    plugins: [
      // 📦 Aquí puedes incluir plugins como forms, typography, etc.
      // require('@tailwindcss/forms'),
      // require('@tailwindcss/typography'),
    ],
  }
  