# Script de Verificación del Proyecto - Todo List
# PowerShell Script

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  Verificación del Proyecto" -ForegroundColor Cyan
Write-Host "  Todo List Application" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Función para verificar comandos
function Test-Command {
    param($command)
    try {
        $null = Get-Command $command -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

# Verificar Node.js
Write-Host "1. Verificando Node.js..." -ForegroundColor Yellow
if (Test-Command node) {
    $nodeVersion = node --version
    Write-Host "   ✅ Node.js instalado: $nodeVersion" -ForegroundColor Green
    
    # Verificar versión
    if ($nodeVersion -match "v(\d+)\.") {
        $major = [int]$matches[1]
        if ($major -ge 18) {
            Write-Host "   ✅ Versión compatible (>= 18.x)" -ForegroundColor Green
        } else {
            Write-Host "   ⚠️  Versión antigua. Se recomienda v18.x o superior" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "   ❌ Node.js no está instalado" -ForegroundColor Red
    Write-Host "   📥 Descargar de: https://nodejs.org/" -ForegroundColor White
}
Write-Host ""

# Verificar npm
Write-Host "2. Verificando npm..." -ForegroundColor Yellow
if (Test-Command npm) {
    $npmVersion = npm --version
    Write-Host "   ✅ npm instalado: v$npmVersion" -ForegroundColor Green
} else {
    Write-Host "   ❌ npm no está instalado" -ForegroundColor Red
}
Write-Host ""

# Verificar MySQL
Write-Host "3. Verificando MySQL..." -ForegroundColor Yellow
if (Test-Command mysql) {
    $mysqlVersion = mysql --version
    Write-Host "   ✅ MySQL instalado: $mysqlVersion" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  MySQL no encontrado en PATH" -ForegroundColor Yellow
    Write-Host "   📝 Verifica que MySQL esté instalado y agregado al PATH" -ForegroundColor White
    
    # Verificar servicio MySQL
    $mysqlService = Get-Service -Name "MySQL*" -ErrorAction SilentlyContinue
    if ($mysqlService) {
        Write-Host "   ✅ Servicio MySQL encontrado: $($mysqlService.Name)" -ForegroundColor Green
        Write-Host "   📊 Estado: $($mysqlService.Status)" -ForegroundColor White
    }
}
Write-Host ""

# Verificar Git
Write-Host "4. Verificando Git..." -ForegroundColor Yellow
if (Test-Command git) {
    $gitVersion = git --version
    Write-Host "   ✅ Git instalado: $gitVersion" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Git no está instalado (opcional)" -ForegroundColor Yellow
}
Write-Host ""

# Verificar estructura del proyecto
Write-Host "5. Verificando estructura del proyecto..." -ForegroundColor Yellow

$requiredDirs = @(
    "backend",
    "frontend",
    "database",
    ".github/workflows"
)

$requiredFiles = @(
    "backend/package.json",
    "backend/src/server.js",
    "frontend/package.json",
    "frontend/src/App.js",
    "database/init.sql",
    ".github/workflows/ci-cd.yml",
    "README.md",
    "docker-compose.yml"
)

$allGood = $true

foreach ($dir in $requiredDirs) {
    if (Test-Path $dir) {
        Write-Host "   ✅ $dir/" -ForegroundColor Green
    } else {
        Write-Host "   ❌ $dir/ - NO ENCONTRADO" -ForegroundColor Red
        $allGood = $false
    }
}

foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "   ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "   ❌ $file - NO ENCONTRADO" -ForegroundColor Red
        $allGood = $false
    }
}
Write-Host ""

# Verificar dependencias del backend
Write-Host "6. Verificando dependencias del backend..." -ForegroundColor Yellow
if (Test-Path "backend/node_modules") {
    Write-Host "   ✅ Dependencias instaladas" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Dependencias no instaladas" -ForegroundColor Yellow
    Write-Host "   📝 Ejecutar: cd backend && npm install" -ForegroundColor White
}
Write-Host ""

# Verificar dependencias del frontend
Write-Host "7. Verificando dependencias del frontend..." -ForegroundColor Yellow
if (Test-Path "frontend/node_modules") {
    Write-Host "   ✅ Dependencias instaladas" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Dependencias no instaladas" -ForegroundColor Yellow
    Write-Host "   📝 Ejecutar: cd frontend && npm install" -ForegroundColor White
}
Write-Host ""

# Verificar archivos .env
Write-Host "8. Verificando configuración de variables de entorno..." -ForegroundColor Yellow
if (Test-Path "backend/.env") {
    Write-Host "   ✅ backend/.env configurado" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  backend/.env no encontrado" -ForegroundColor Yellow
    Write-Host "   📝 Copiar: cp backend/.env.example backend/.env" -ForegroundColor White
}

if (Test-Path "frontend/.env") {
    Write-Host "   ✅ frontend/.env configurado" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  frontend/.env no encontrado" -ForegroundColor Yellow
    Write-Host "   📝 Copiar: cp frontend/.env.example frontend/.env" -ForegroundColor White
}
Write-Host ""

# Resumen
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  Resumen de la Verificación" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

if ($allGood) {
    Write-Host "✅ Estructura del proyecto: CORRECTA" -ForegroundColor Green
} else {
    Write-Host "❌ Estructura del proyecto: INCOMPLETA" -ForegroundColor Red
}

Write-Host ""
Write-Host "📚 Próximos pasos:" -ForegroundColor Cyan
Write-Host "   1. Instalar dependencias si no están instaladas" -ForegroundColor White
Write-Host "   2. Configurar archivos .env" -ForegroundColor White
Write-Host "   3. Inicializar la base de datos" -ForegroundColor White
Write-Host "   4. Ejecutar los tests" -ForegroundColor White
Write-Host "   5. Iniciar el proyecto" -ForegroundColor White
Write-Host ""
Write-Host "📖 Ver QUICKSTART.md para instrucciones detalladas" -ForegroundColor Yellow
Write-Host ""
