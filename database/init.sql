-- Crear base de datos
CREATE DATABASE IF NOT EXISTS todo_db;

-- Usar la base de datos
USE todo_db;

-- Crear tabla de tareas
CREATE TABLE IF NOT EXISTS tareas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(255) NOT NULL,
  completada TINYINT(1) DEFAULT 0,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_fecha_creacion (fecha_creacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos de ejemplo (opcional)
INSERT INTO tareas (descripcion, completada) VALUES 
  ('Completar el proyecto de Ingeniería de Software', 0),
  ('Configurar el entorno de desarrollo', 1),
  ('Implementar pruebas E2E con Cypress', 0);
