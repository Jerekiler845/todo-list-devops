import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react({
      include: '**/*.{jsx,js}',
    }),
  ],
  esbuild: {
    loader: 'jsx',
  },
  optimizeDeps: {
    esbuildOptions: {
      loader: {
        '.js': 'jsx',
      },
    },
  },

  // 🔥 Config para correr en Render (QA + PROD)
  server: {
    host: true, // expone en 0.0.0.0
    port: 3000,
    allowedHosts: [
      'todo-frontend-qa.onrender.com',
      'todo-frontend-prod-oacy.onrender.com', // ← TU HOST REAL DE PROD
    ],
  },

  build: {
    outDir: 'build',
  },

  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/setupTests.js',
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html', 'lcov'],
      include: ['src/**/*.{js,jsx}'],
      exclude: ['src/index.js', 'src/reportWebVitals.js'],
      lines: 70,
      functions: 70,
      branches: 70,
      statements: 70,
    },
  },
});
