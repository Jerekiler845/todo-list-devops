# 📝 Gestor de Tareas - Todo List Application

Aplicación web completa de gestión de tareas desarrollada con React, Node.js y MySQL, implementando las mejores prácticas de desarrollo con testing, CI/CD y quality gates.

## 📋 Tabla de Contenidos

- [Stack Tecnológico](#stack-tecnológico)
- [Características](#características)
- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Ejecución](#ejecución)
- [Testing](#testing)
- [CI/CD](#cicd)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [API Documentation](#api-documentation)

## 🛠️ Stack Tecnológico

| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| React | ^18.2.0 | Frontend Framework |
| Node.js | ^18.0.0 | Backend Runtime |
| Express | ^4.18.2 | Backend Framework |
| MySQL | ^8.0.0 | Base de Datos |
| Jest | ^29.5.0 | Unit Testing |
| Cypress | ^13.7.0 | E2E Testing |
| ESLint | ^8.57.0 | Static Analysis |
| Prettier | ^3.2.5 | Code Formatting |
| GitHub Actions | - | CI/CD Pipeline |

## ✨ Características

### Funcionalidades Principales (RF)

- **RF-001**: Crear nuevas tareas con descripción
- **RF-002**: Listar todas las tareas con su estado
- **RF-003**: Marcar tareas como completadas
- **RF-004**: Desmarcar tareas completadas
- **RF-005**: Persistencia en base de datos MySQL
- **RF-006**: Distinción visual de tareas completadas (texto tachado)

### Calidad y Testing (RNF)

- ✅ **Code Coverage >= 70%** en Frontend y Backend
- ✅ **ESLint** configurado para detectar bugs y code smells
- ✅ **Prettier** para formato de código consistente
- ✅ **Pruebas E2E** con Cypress
- ✅ **CI/CD Pipeline** con GitHub Actions
- ✅ **Quality Gates** automáticos

## 📦 Requisitos Previos

- **Node.js**: v18.x
- **npm**: v8.x o superior
- **MySQL**: v8.0.x
- **Git**: Para clonar el repositorio

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/tobiasvnicolas/todo-list.git
cd todo-list
```

### 2. Instalar dependencias del Backend

```bash
cd backend
npm install
```

### 3. Instalar dependencias del Frontend

```bash
cd ../frontend
npm install
```

### 4. Configurar la Base de Datos

```bash
# Iniciar MySQL y ejecutar el script de inicialización
mysql -u root -p < ../database/init.sql
```

## ⚙️ Configuración

### Backend

Crear archivo `.env` en la carpeta `backend`:

```bash
cd backend
cp .env.example .env
```

Editar `.env` con tus credenciales:

```env
PORT=3001
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=tu_password
DB_NAME=todo_db
DB_PORT=3306
```

### Frontend

Crear archivo `.env` en la carpeta `frontend`:

```bash
cd frontend
cp .env.example .env
```

Contenido del `.env`:

```env
REACT_APP_API_URL=http://localhost:3001/api
```

## 🏃 Ejecución

### Desarrollo

**Terminal 1 - Backend:**
```bash
cd backend
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm start
```

La aplicación estará disponible en:
- Frontend: http://localhost:3000
- Backend API: http://localhost:3001/api

### Producción

**Backend:**
```bash
cd backend
npm start
```

**Frontend:**
```bash
cd frontend
npm run build
# Servir la carpeta build con un servidor web
```

## 🧪 Testing

### Tests Unitarios - Backend

```bash
cd backend
npm test                    # Ejecutar tests con coverage
npm run test:watch         # Modo watch
```

### Tests Unitarios - Frontend

```bash
cd frontend
npm test                    # Ejecutar tests con coverage
npm run test:watch         # Modo watch
```

### Tests E2E - Cypress

```bash
cd frontend
npx cypress open           # Modo interactivo
npx cypress run            # Modo headless (CI)
```

### Code Coverage

Los reportes de cobertura se generan en:
- Backend: `backend/coverage/`
- Frontend: `frontend/coverage/`

**Threshold mínimo: 70%** ✅

### Análisis Estático

**ESLint:**
```bash
# Backend
cd backend
npm run lint
npm run lint:fix

# Frontend
cd frontend
npm run lint
npm run lint:fix
```

**Prettier:**
```bash
# Backend
cd backend
npm run format

# Frontend
cd frontend
npm run format
```

## 🔄 CI/CD

### GitHub Actions Pipeline

El proyecto incluye un pipeline completo de CI/CD que se ejecuta en cada push o pull request:

#### Jobs del Pipeline:

1. **backend-tests**
   - Instala dependencias
   - Ejecuta ESLint
   - Verifica formato con Prettier
   - Ejecuta tests con coverage
   - Valida coverage >= 70%

2. **frontend-tests**
   - Instala dependencias
   - Ejecuta ESLint
   - Verifica formato con Prettier
   - Ejecuta tests con coverage
   - Valida coverage >= 70%

3. **e2e-tests**
   - Configura MySQL
   - Inicia backend y frontend
   - Ejecuta tests E2E con Cypress

4. **quality-gate**
   - Valida que todos los jobs anteriores pasaron
   - Bloquea el merge si hay fallos

### Quality Gates

El pipeline **bloqueará** el merge si:

- ❌ Code Coverage < 70%
- ❌ Fallan tests (Unit, Integration o E2E)
- ❌ ESLint reporta issues críticos
- ❌ El código no cumple con las reglas de Prettier

## 📁 Estructura del Proyecto

```
todo-list/
├── .github/
│   └── workflows/
│       └── ci-cd.yml          # Pipeline de CI/CD
├── backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── database.js    # Configuración MySQL
│   │   ├── controllers/
│   │   │   └── tareaController.js
│   │   ├── models/
│   │   │   └── tareaModel.js
│   │   ├── routes/
│   │   │   └── tareaRoutes.js
│   │   ├── app.js             # Express app
│   │   └── server.js          # Entry point
│   ├── tests/
│   │   └── api.test.js        # Tests del API
│   ├── .eslintrc.js
│   ├── .prettierrc
│   ├── .env.example
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── TareaForm.js
│   │   │   ├── TareaItem.js
│   │   │   └── TareaList.js
│   │   ├── services/
│   │   │   └── api.js         # API client
│   │   ├── __tests__/         # Unit tests
│   │   ├── App.js
│   │   └── index.js
│   ├── cypress/
│   │   ├── e2e/
│   │   │   └── todo.cy.js     # E2E tests
│   │   └── support/
│   ├── public/
│   ├── .eslintrc.js
│   ├── .prettierrc
│   ├── cypress.config.js
│   └── package.json
├── database/
│   └── init.sql               # Script de inicialización
├── README.md
└── RF_RNF-TODO-List.md       # Requisitos del proyecto
```

## 📡 API Documentation

### Endpoints

#### GET /api/tareas
Obtiene todas las tareas.

**Response:**
```json
[
  {
    "id": 1,
    "descripcion": "Tarea de ejemplo",
    "completada": 0,
    "fecha_creacion": "2025-11-12T10:00:00.000Z"
  }
]
```

#### POST /api/tareas
Crea una nueva tarea.

**Request Body:**
```json
{
  "descripcion": "Nueva tarea"
}
```

**Response:**
```json
{
  "id": 2,
  "descripcion": "Nueva tarea",
  "completada": 0,
  "fecha_creacion": "2025-11-12T10:05:00.000Z"
}
```

#### PUT /api/tareas/:id
Actualiza el estado de una tarea.

**Request Body:**
```json
{
  "completada": true
}
```

**Response:**
```json
{
  "id": 2,
  "descripcion": "Nueva tarea",
  "completada": 1,
  "fecha_creacion": "2025-11-12T10:05:00.000Z"
}
```

## 🗄️ Base de Datos

### Tabla: tareas

| Campo | Tipo | Descripción |
|-------|------|-------------|
| id | INT (PK, AUTO_INCREMENT) | Identificador único |
| descripcion | VARCHAR(255) | Descripción de la tarea |
| completada | TINYINT(1) | Estado (0: pendiente, 1: completada) |
| fecha_creacion | TIMESTAMP | Fecha de creación |

## 🎯 Checklist de Completitud

### Requisitos Funcionales
- ✅ RF-001: Endpoint POST para crear tareas
- ✅ RF-002: Endpoint GET para listar tareas
- ✅ RF-003/004: Endpoint PUT para toggle de estado
- ✅ RF-005: Persistencia en MySQL
- ✅ RF-006: Distinción visual de tareas completadas

### Requisitos No Funcionales
- ✅ RNF-A01: Code Coverage configurado
- ✅ RNF-A02: Coverage >= 70% alcanzado
- ✅ RNF-A03: ESLint configurado y sin issues críticos
- ✅ RNF-A04: Prettier configurado
- ✅ RNF-A05: Pruebas E2E con Cypress
- ✅ RNF-B01: Pipeline de GitHub Actions
- ✅ RNF-B02: Quality Gates implementados

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

**Nota:** Asegúrate de que todos los tests pasen y el coverage sea >= 70% antes de crear el PR.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 👨‍💻 Autor

- **Tobías Nicolás**
- GitHub: [@tobiasvnicolas](https://github.com/tobiasvnicolas)

## 🙏 Agradecimientos

- Proyecto desarrollado para la materia Ingeniería de Software III
- Implementa best practices de desarrollo moderno
- Enfocado en calidad y automatización

---

**Versión:** 1.0.0  
**Fecha:** Noviembre 2025
