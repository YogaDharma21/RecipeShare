# Scripts

Utility scripts for RecipeShare monorepo.

## Available Scripts

### Install Dependencies

**Linux/Mac:**
```bash
./scripts/install.sh
```

**Windows (PowerShell):**
```powershell
.\scripts\install.ps1
```

This script:
- Installs backend dependencies (Composer)
- Installs frontend dependencies (npm)
- Creates `.env` files from examples
- Generates Laravel application key

### Run Application

**Linux/Mac:**
```bash
./scripts/run.sh
```

**Windows (PowerShell):**
```powershell
.\scripts\run.ps1
```

Starts both backend and frontend servers:
- Backend: http://localhost:8000
- Frontend: http://localhost:5173

### Docker

**Start services:**
```bash
# Linux/Mac
./scripts/docker-up.sh

# Windows
.\scripts\docker-up.ps1
```

**Stop services:**
```bash
# Linux/Mac
./scripts/docker-down.sh

# Windows
.\scripts\docker-down.ps1
```

## Requirements

- **Install script**: PHP, Composer, Node.js, npm
- **Run script**: Dependencies must be installed first
- **Docker script**: Docker and Docker Compose