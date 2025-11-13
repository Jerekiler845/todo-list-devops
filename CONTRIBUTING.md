# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir al proyecto Todo List! Esta guía te ayudará a hacer contribuciones de calidad.

## 📋 Código de Conducta

- Sé respetuoso y profesional
- Acepta críticas constructivas
- Enfócate en lo mejor para el proyecto
- Mantén un ambiente colaborativo

## 🚀 Cómo Contribuir

### 1. Fork y Clone

```bash
# Fork el repositorio en GitHub
# Luego clona tu fork
git clone https://github.com/tu-usuario/todo-list.git
cd todo-list
```

### 2. Crear una Branch

```bash
# Crear branch para tu feature/fix
git checkout -b feature/nombre-descriptivo
# o
git checkout -b fix/nombre-del-bug
```

### 3. Configurar el Entorno

```bash
# Instalar dependencias
cd backend && npm install
cd ../frontend && npm install

# Configurar .env
cp backend/.env.example backend/.env
cp frontend/.env.example frontend/.env

# Inicializar base de datos
mysql -u root -p < database/init.sql
```

### 4. Hacer Cambios

- Escribe código limpio y legible
- Sigue las convenciones de estilo del proyecto
- Agrega comentarios cuando sea necesario
- Mantén los commits pequeños y enfocados

### 5. Ejecutar Tests

```bash
# Backend
cd backend
npm test
npm run lint

# Frontend
cd frontend
npm test
npm run lint

# E2E
cd frontend
npx cypress run
```

### 6. Commit

Usa [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Formato
<tipo>(<scope>): <descripción>

# Ejemplos
git commit -m "feat(backend): agregar endpoint de eliminación"
git commit -m "fix(frontend): corregir bug en toggle de tareas"
git commit -m "test(e2e): agregar tests para filtros"
git commit -m "docs: actualizar README con nuevas instrucciones"
git commit -m "refactor(api): mejorar manejo de errores"
```

**Tipos de commit:**
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en documentación
- `test`: Agregar o modificar tests
- `refactor`: Refactorización de código
- `style`: Cambios de formato (prettier, espacios, etc.)
- `chore`: Cambios en build, dependencias, etc.
- `perf`: Mejoras de performance

### 7. Push y Pull Request

```bash
# Push a tu fork
git push origin feature/nombre-descriptivo
```

Luego crea un Pull Request en GitHub con:
- Título descriptivo
- Descripción detallada de los cambios
- Referencias a issues relacionados
- Screenshots (si aplica)

## ✅ Checklist antes de PR

Antes de crear un Pull Request, verifica:

- [ ] El código compila sin errores
- [ ] Todos los tests pasan (unitarios y E2E)
- [ ] ESLint no reporta errores
- [ ] El código está formateado con Prettier
- [ ] Code coverage >= 70%
- [ ] Documentación actualizada si es necesario
- [ ] No hay console.logs de debug
- [ ] Variables sensibles en .env (no hardcodeadas)
- [ ] Commits siguen Conventional Commits
- [ ] Branch actualizada con main

## 📝 Estándares de Código

### JavaScript/React

```javascript
// ✅ Bueno
const getTareas = async () => {
  try {
    const response = await fetch('/api/tareas');
    return response.json();
  } catch (error) {
    console.error('Error al obtener tareas:', error);
    throw error;
  }
};

// ❌ Malo
const getTareas = async () => {
  return fetch('/api/tareas').then(r => r.json())
}
```

### Nombres de Variables

```javascript
// ✅ Bueno - descriptivo y en español
const tareaCompletada = true;
const listaDeTareas = [];
const handleCrearTarea = () => {};

// ❌ Malo - abreviado o confuso
const tc = true;
const list = [];
const handle = () => {};
```

### Componentes React

```javascript
// ✅ Bueno
const TareaItem = ({ tarea, onToggle }) => {
  const handleClick = () => {
    onToggle(tarea.id, !tarea.completada);
  };

  return (
    <div className="tarea-item">
      <input type="checkbox" onChange={handleClick} />
      <span>{tarea.descripcion}</span>
    </div>
  );
};

// ❌ Malo - sin PropTypes, nombres genéricos
const Item = ({ data, onClick }) => {
  return <div onClick={() => onClick(data.id)}>{data.text}</div>;
};
```

### Backend - Controllers

```javascript
// ✅ Bueno
static async create(req, res) {
  try {
    const { descripcion } = req.body;
    
    if (!descripcion || descripcion.trim() === '') {
      return res.status(400).json({ 
        error: 'La descripción es requerida' 
      });
    }
    
    const tarea = await TareaModel.create(descripcion);
    res.status(201).json(tarea);
  } catch (error) {
    console.error('Error al crear tarea:', error);
    res.status(500).json({ error: 'Error al crear tarea' });
  }
}

// ❌ Malo - sin validación, mal manejo de errores
static async create(req, res) {
  const tarea = await TareaModel.create(req.body.descripcion);
  res.json(tarea);
}
```

## 🧪 Estándares de Testing

### Tests Unitarios

```javascript
// ✅ Bueno - descriptivo, completo
describe('TareaController.create', () => {
  it('debería crear una tarea con descripción válida', async () => {
    const mockTarea = { id: 1, descripcion: 'Test', completada: 0 };
    TareaModel.create.mockResolvedValue(mockTarea);
    
    const response = await request(app)
      .post('/api/tareas')
      .send({ descripcion: 'Test' });
    
    expect(response.status).toBe(201);
    expect(response.body).toEqual(mockTarea);
  });
  
  it('debería retornar error si la descripción está vacía', async () => {
    const response = await request(app)
      .post('/api/tareas')
      .send({ descripcion: '' });
    
    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('error');
  });
});

// ❌ Malo - poco descriptivo, incompleto
it('works', async () => {
  const res = await request(app).post('/api/tareas').send({ descripcion: 'x' });
  expect(res.status).toBe(201);
});
```

### Tests E2E

```javascript
// ✅ Bueno - flujo completo, verificaciones claras
describe('Crear tarea', () => {
  it('debería permitir crear y visualizar una nueva tarea', () => {
    const nuevaTarea = 'Completar el proyecto';
    
    cy.visit('/');
    cy.get('[data-testid="tarea-input"]').type(nuevaTarea);
    cy.get('[data-testid="submit-button"]').click();
    cy.contains(nuevaTarea).should('be.visible');
    cy.get('[data-testid="tarea-input"]').should('have.value', '');
  });
});

// ❌ Malo - selectores frágiles, sin verificaciones
it('create task', () => {
  cy.visit('/');
  cy.get('input').type('Task');
  cy.get('button').click();
});
```

## 📐 Estructura de Archivos

### Nuevos Componentes

```
frontend/src/components/
├── NuevoComponente.js
├── NuevoComponente.css
└── __tests__/
    └── NuevoComponente.test.js
```

### Nuevos Endpoints

```
backend/src/
├── controllers/
│   └── nuevoController.js
├── models/
│   └── nuevoModel.js
├── routes/
│   └── nuevoRoutes.js
└── tests/
    └── nuevo.test.js
```

## 🔍 Code Review

Durante el code review, verificaremos:

1. **Funcionalidad**: ¿El código hace lo que debe hacer?
2. **Tests**: ¿Hay tests adecuados? ¿Pasan todos?
3. **Calidad**: ¿El código es limpio y mantenible?
4. **Performance**: ¿Hay problemas de rendimiento?
5. **Seguridad**: ¿Hay vulnerabilidades?
6. **Documentación**: ¿Está bien documentado?

## 🐛 Reportar Bugs

Al reportar un bug, incluye:

1. **Descripción clara** del problema
2. **Pasos para reproducir**
3. **Comportamiento esperado** vs actual
4. **Screenshots** si aplica
5. **Entorno** (OS, Node version, etc.)
6. **Logs de error**

Template:

```markdown
**Descripción:**
Las tareas no se marcan como completadas al hacer clic

**Pasos para reproducir:**
1. Crear una nueva tarea
2. Hacer clic en el checkbox
3. La tarea no cambia de estado

**Esperado:**
La tarea debería aparecer tachada

**Actual:**
No pasa nada

**Entorno:**
- OS: Windows 11
- Node: v18.17.0
- Browser: Chrome 119

**Error:**
```
Error en consola: Cannot read property 'id' of undefined
```
```

## 💡 Sugerencias de Mejora

Áreas donde puedes contribuir:

### Funcionalidades
- [ ] Editar descripción de tareas
- [ ] Eliminar tareas
- [ ] Filtros (todas/completadas/pendientes)
- [ ] Búsqueda de tareas
- [ ] Categorías o tags
- [ ] Fechas de vencimiento
- [ ] Prioridades

### Mejoras Técnicas
- [ ] Autenticación de usuarios
- [ ] Paginación
- [ ] Ordenamiento personalizado
- [ ] Dark mode
- [ ] PWA features
- [ ] Optimistic UI updates
- [ ] WebSockets para updates en tiempo real

### DevOps
- [ ] Deployment automático
- [ ] Monitoring y alertas
- [ ] Performance testing
- [ ] Security scanning
- [ ] Better Docker optimization

### Documentación
- [ ] Video tutorial
- [ ] API documentation con Swagger
- [ ] Architecture diagrams
- [ ] Troubleshooting guide expandido

## 📞 Contacto

Si tienes preguntas:
- Abre un Issue en GitHub
- Revisa Issues existentes
- Consulta la documentación en README.md

## 🙏 Reconocimientos

Todos los contribuidores serán añadidos al archivo CONTRIBUTORS.md

---

¡Gracias por contribuir al proyecto! 🎉
