# 🚀 Guía de Inicio Rápido - Todo List

Esta guía te ayudará a poner en marcha el proyecto en pocos minutos.

## Requisitos

Antes de comenzar, asegúrate de tener instalado:

- ✅ Node.js v18.x
- ✅ MySQL v8.0.x
- ✅ npm v8.x+

## Pasos de Instalación

### 1️⃣ Configurar la Base de Datos

```bash
# Iniciar sesión en MySQL
mysql -u root -p

# Ejecutar el script de inicialización
source database/init.sql

# Verificar que la base de datos fue creada
SHOW DATABASES;
USE todo_db;
SHOW TABLES;
```

### 2️⃣ Configurar el Backend

```bash
# Navegar a la carpeta backend
cd backend

# Instalar dependencias
npm install

# Copiar archivo de ejemplo de variables de entorno
cp .env.example .env

# Editar .env con tus credenciales de MySQL
# Usar notepad, vim, nano, o tu editor favorito
notepad .env
```

**Contenido de `.env`:**
```env
PORT=3001
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=todo_db
DB_PORT=3306
```

### 3️⃣ Configurar el Frontend

```bash
# Navegar a la carpeta frontend
cd ../frontend

# Instalar dependencias
npm install

# Copiar archivo de ejemplo de variables de entorno
cp .env.example .env
```

El archivo `.env` del frontend ya está configurado correctamente:
```env
REACT_APP_API_URL=http://localhost:3001/api
```

### 4️⃣ Ejecutar el Proyecto

**Opción A: Usando dos terminales (Recomendado)**

**Terminal 1 - Backend:**
```bash
cd backend
npm run dev
```

Deberías ver:
```
Servidor corriendo en puerto 3001
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm start
```

El navegador se abrirá automáticamente en `http://localhost:3000`

**Opción B: PowerShell (Windows) - Una sola terminal**

```powershell
# Iniciar backend en segundo plano
cd backend
Start-Process npm -ArgumentList "run dev"

# Esperar 3 segundos
Start-Sleep -Seconds 3

# Iniciar frontend
cd ..\frontend
npm start
```

## 🧪 Verificar la Instalación

### 1. Verificar el Backend

Abrir el navegador en: http://localhost:3001/health

Deberías ver:
```json
{"status":"OK"}
```

### 2. Verificar el Frontend

Abrir el navegador en: http://localhost:3000

Deberías ver la interfaz del Gestor de Tareas.

### 3. Probar la funcionalidad

1. Escribir "Mi primera tarea" en el campo de texto
2. Hacer clic en "Agregar"
3. La tarea debería aparecer en la lista
4. Hacer clic en el checkbox para marcarla como completada
5. La tarea debería aparecer tachada

## 🧪 Ejecutar Tests

### Tests del Backend
```bash
cd backend
npm test
```

### Tests del Frontend
```bash
cd frontend
npm test
```

### Tests E2E con Cypress

**Asegúrate de que tanto el backend como el frontend estén corriendo**

```bash
cd frontend
npx cypress open
```

## 🔍 Verificar Code Coverage

### Backend
```bash
cd backend
npm test
# El reporte se genera en: backend/coverage/lcov-report/index.html
```

### Frontend
```bash
cd frontend
npm test
# El reporte se genera en: frontend/coverage/lcov-report/index.html
```

## 🛠️ Comandos Útiles

### Backend
```bash
npm run dev        # Ejecutar en modo desarrollo (con nodemon)
npm start          # Ejecutar en modo producción
npm test           # Ejecutar tests con coverage
npm run lint       # Verificar código con ESLint
npm run lint:fix   # Corregir problemas de ESLint automáticamente
npm run format     # Formatear código con Prettier
```

### Frontend
```bash
npm start          # Ejecutar en modo desarrollo
npm run build      # Compilar para producción
npm test           # Ejecutar tests con coverage
npm run lint       # Verificar código con ESLint
npm run lint:fix   # Corregir problemas de ESLint automáticamente
npm run format     # Formatear código con Prettier
```

## ❗ Solución de Problemas

### El backend no se conecta a MySQL

**Error:** `ECONNREFUSED` o `ER_ACCESS_DENIED_ERROR`

**Solución:**
1. Verificar que MySQL esté corriendo
2. Verificar las credenciales en el archivo `.env`
3. Verificar que la base de datos `todo_db` exista

```bash
# Windows (PowerShell como administrador)
Get-Service MySQL*

# Si no está corriendo, iniciarlo
Start-Service MySQL80
```

### El frontend no puede conectarse al backend

**Error:** `Network Error` en la consola del navegador

**Solución:**
1. Verificar que el backend esté corriendo en el puerto 3001
2. Verificar la variable `REACT_APP_API_URL` en `frontend/.env`
3. Reiniciar el frontend después de cambiar variables de entorno

### Los tests fallan

**Problema:** Tests fallan al ejecutarlos

**Solución:**
1. Asegurarse de que todas las dependencias estén instaladas
2. Borrar `node_modules` y reinstalar:
```bash
rm -rf node_modules
npm install
```

### Puerto ya en uso

**Error:** `EADDRINUSE: address already in use :::3000`

**Solución:**
```powershell
# Windows - Encontrar el proceso usando el puerto
netstat -ano | findstr :3000

# Matar el proceso (reemplazar PID con el número que aparece)
taskkill /PID <PID> /F
```

## 📚 Próximos Pasos

1. Lee la documentación completa en [README.md](README.md)
2. Revisa los requisitos en [RF_RNF-TODO-List.md](RF_RNF-TODO-List.md)
3. Explora la estructura del proyecto
4. Ejecuta los tests E2E con Cypress
5. Revisa el pipeline de CI/CD en `.github/workflows/ci-cd.yml`

## 🎉 ¡Todo listo!

Si llegaste hasta aquí, tu entorno de desarrollo está completamente configurado. ¡Feliz coding! 🚀
