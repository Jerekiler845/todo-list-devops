## **📄 Requisitos del Proyecto: Gestor de Tareas Básico**

Este documento define los requisitos funcionales y no funcionales para desarrollar la aplicación **Gestor de Tareas Básico** (To-Do List) utilizando el *stack* de tecnologías especificado, enfocándose en la calidad y la automatización del proceso de desarrollo.

## **💻 Stack Tecnológico Requerido**

El proyecto debe adherirse estrictamente a las siguientes tecnologías, **sin usar versiones superiores a las indicadas (**$\\wedge$**)** para mantener la consistencia del entorno de pruebas y CI/CD.

| Capa/Función | Tecnología | Versión (Máximo ∧) |
| :---- | :---- | :---- |
| **Frontend** | React | $\\wedge 18.0.0$ |
| **Backend** | Node.js | $\\wedge 18.0 .0$ |
| **Base de Datos** | MySQL | $\\wedge 8.0 .0$ |
| **Análisis Estático** | ESLint | $\\wedge 8.0 .0$ |
| **Formato** | Prettier | $\\wedge 3.0 .0$ |
| **Pruebas E2E** | Cypress | $\\wedge 13.0 .0$ |
| **CI/CD** | Github Actions | \- |

## **🛠️ Requisitos Funcionales (RF)**

Los requisitos funcionales describen lo que la aplicación debe hacer.

| ID | Requisito Funcional | Prioridad |
| :---- | :---- | :---- |
| **RF-001** | El sistema debe permitir al usuario **crear** una nueva tarea proporcionando una descripción de texto a través del frontend. | Alta |
| **RF-002** | El sistema debe **mostrar** una lista de todas las tareas existentes, incluyendo su descripción y estado (completada/pendiente). | Alta |
| **RF-003** | El sistema debe permitir al usuario **marcar** una tarea como completada, persistiendo el cambio en la base de datos. | Alta |
| **RF-004** | El sistema debe permitir al usuario **desmarcar** una tarea como pendiente, persistiendo el cambio en la base de datos. | Media |
| **RF-005** | La información de las tareas y sus estados debe ser recuperada y almacenada en la base de datos MySQL, asegurando la persistencia. | Alta |
| **RF-006** | La interfaz de usuario debe distinguir visualmente las tareas completadas (ej. mediante texto tachado o un icono de verificación). | Media |

## **🛡️ Requisitos No Funcionales (RNF)**

Los requisitos no funcionales se centran en la calidad, las restricciones y las herramientas de desarrollo, cubriendo los pasos de integración de calidad solicitados.

### **A. Requisitos de Calidad de Código y Pruebas**

| ID | Requisito No Funcional | Categoría |
| :---- | :---- | :---- |
| **RNF-A01** | Se deben incluir herramientas de **Code Coverage** (ej. Istanbul/NYC, Jest Coverage) en el Backend y Frontend para medir la ejecución del código bajo prueba. | Test |
| **RNF-A02** | El proyecto debe alcanzar un **mínimo de** $70\\%$ **de Code Coverage** global (idealmente $100\\%$), priorizando la cobertura a través de pruebas unitarias/integración. | Test |
| **RNF-A03** | Se debe configurar y aplicar **ESLint** para identificar **bugs**, **vulnerabilidades** y **code smells** en todo el código fuente (Front y Back). | Estático |
| **RNF-A04** | Se debe configurar **Prettier** para asegurar un formato de código uniforme y evitar conflictos de estilo. | Estático |
| **RNF-A05** | Se deben desarrollar **pruebas End-to-End (E2E) con Cypress** para validar los flujos completos: Creación de Tarea y Cambio de Estado (*Toggle*) (RF-001, RF-003/004). | E2E |

### **B. Requisitos de CI/CD y Automatización**

| ID | Requisito No Funcional | Categoría |
| :---- | :---- | :---- |
| **RNF-B01** | Se debe implementar un *pipeline* de **Integración Continua (CI)** mediante **Github Actions** que se ejecute automáticamente en cada *Push* o *Pull Request*. | CI/CD |
| **RNF-B02** | El *pipeline* de CI/CD debe incluir **Quality Gates** que **bloqueen** el *merge* o *deploy* si: | CI/CD |
|  | a) La **Cobertura de Código** es $\\mathbf{\< 70\\%}$. |  |
|  | b) Fallan las **pruebas** (Unitarias, Integración o E2E). |  |
|  | c) El **Análisis Estático** (ESLint) reporta **issues críticos** (*bugs*, vulnerabilidades o *code smells* de alta severidad). |  |

## **🏛️ Estructura de la Base de Datos (MySQL)**

La base de datos se limita a una única tabla para gestionar las tareas.

### **Tablas y Relaciones**

| Tabla | Descripción | Relaciones |
| :---- | :---- | :---- |
| **tareas** | Almacena cada tarea individual, su descripción y estado de completitud. | (No tiene relaciones con otras tablas) |

#### **Campos de la Tabla tareas (Propuesta)**

* id (Clave primaria)  
* descripcion (Cadena de texto, el contenido de la tarea)  
* completada (Booleano/TinyInt, true si está completada, false por defecto)  
* fecha\_creacion (Timestamp o DateTime, para ordenar si es necesario)

## **✅ Checklist de Completitud del Desarrollo**

Esta lista sirve para verificar que todos los requisitos funcionales y de calidad han sido implementados y validados.

### **A. Desarrollo y Funcionalidad (RF)**

* \[ \] RF-001: Implementado el *endpoint* POST para crear tareas.  
* \[ \] RF-002: Implementado el *endpoint* GET para listar tareas.  
* \[ \] RF-003/004: Implementado el *endpoint* PUT para cambiar el estado (*toggle*) de la tarea.  
* \[ \] RF-005: El Front interactúa correctamente con el Back y la persistencia en MySQL funciona.  
* \[ \] RF-006: Las tareas completadas se distinguen visualmente en el Front.

### **B. Calidad y Automatización (RNF)**

* \[ \] RNF-A01: Code Coverage configurado y reportando métricas.  
* \[ \] RNF-A02: Cobertura de código $\\geq 70\\%$ alcanzada y verificada.  
* \[ \] RNF-A03: Cero *issues* de severidad Crítica/Mayor reportados por ESLint/Análisis Estático.  
* \[ \] RNF-A04: Formato de código automatizado y consistente (Prettier).  
* \[ \] RNF-A05: Pruebas E2E completas con Cypress para los flujos de Creación y Toggle.  
* \[ \] RNF-B01: *Pipeline* de Github Actions funcionando en PR/Push.  
* \[ \] RNF-B02: **Quality Gates** implementados y activos para bloquear *merges* defectuosos.