// astro.config.mjs
// @ts-check
import { defineConfig } from "astro/config";

import tailwindcss from "@tailwindcss/vite";
import react from "@astrojs/react";

// https://astro.build/config
export default defineConfig({
  // ──────────────────────────────────────────────
  // Vite section (dev-time config)
  // ──────────────────────────────────────────────
  vite: {
    plugins: [tailwindcss()],
    server: {
      // Proxy peticiones a /api/* -> backend FastAPI (puerto 8000)
      proxy: {
        "/api": "http://localhost:8000",
      },
    },
  },

  // ──────────────────────────────────────────────
  // Astro integrations
  // ──────────────────────────────────────────────
  integrations: [react()],
});
