# RecipeShare

A **polyglot monorepo** for a recipe sharing platform with Laravel backend and React frontend.

## Project Overview

RecipeShare is a web application that allows users to browse, search, and download recipes. It features a Laravel API backend with Filament admin panel and a React TypeScript frontend.

### Architecture

```
recipeshare/
├── apps/
│   ├── backend/          # Laravel 11 API + Filament admin
│   └── web/              # React 18 + TypeScript + Vite
├── docker/                # Docker configurations
├── docs/                 # Architecture documentation
└── scripts/              # Setup and run scripts
```

### Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | React 18, TypeScript, Vite, Tailwind CSS, Axios |
| Backend | Laravel 11, PHP 8.2, Filament 3.x |
| Database | MySQL (via Docker) |
| Admin Panel | Filament PHP |

### Features

- **Recipe Management**: Browse, search, and view detailed recipes
- **Categories**: Filter recipes by category
- **PDF Download**: Download recipes as PDF
- **Video Tutorials**: Embedded cooking videos
- **API Authentication**: API key protected endpoints

## Getting Started

### Prerequisites

- **Backend**: PHP 8.2+, Composer
- **Frontend**: Node.js 18+, npm
- **Database**: MySQL 8.0+ (or use Docker)
- **Docker**: Optional - for containerized setup

### Quick Start (Local)

#### 1. Clone and Navigate

```bash
git clone https://github.com/YogaDharma21/recipeshare.git
cd recipeshare
```

#### 2. Install Dependencies

**Windows (PowerShell):**
```powershell
.\scripts\install.ps1
```

**Linux/Mac:**
```bash
./scripts/install.sh
```

#### 3. Run Applications

**Windows (PowerShell):**
```powershell
.\scripts\run.ps1
```

**Linux/Mac:**
```bash
./scripts/run.sh
```

This will start:
- Backend: http://localhost:8000
- Frontend: http://localhost:5173
- API: http://localhost:8000/api

### Docker Setup (Optional)

#### Start Services

**Windows (PowerShell):**
```powershell
.\scripts\docker-up.ps1
```

**Linux/Mac:**
```bash
./scripts/docker-up.sh
```

#### Stop Services

**Windows (PowerShell):**
```powershell
.\scripts\docker-down.ps1
```

**Linux/Mac:**
```bash
./scripts/docker-down.sh
```

## Project Structure

### Backend (`apps/backend/`)

```
apps/backend/
├── app/                  # Laravel application code
├── config/               # Configuration files
├── database/             # Migrations, seeders
├── routes/               # API and web routes
├── resources/            # Views, assets
├── storage/              # Logs, cache
├── tests/                # PHPUnit/Pest tests
├── artisan               # CLI entry point
├── composer.json         # PHP dependencies
└── vite.config.js        # Asset bundling
```

**Key Commands:**
```bash
cd apps/backend
composer install
php artisan migrate
php artisan serve
php artisan test
```

### Frontend (`apps/web/`)

```
apps/web/
├── src/                  # React source code
│   ├── components/       # UI components
│   ├── pages/            # Page components
│   ├── hooks/            # Custom hooks
│   ├── services/         # API calls
│   └── types/            # TypeScript types
├── public/               # Static assets
├── index.html            # Entry point
├── package.json          # Node dependencies
├── vite.config.ts        # Vite configuration
└── tailwind.config.js   # Tailwind CSS
```

**Key Commands:**
```bash
cd apps/web
npm install
npm run dev
npm run build
npm run lint
```

## API Documentation

### Base URL
```
http://localhost:8000/api
```

### Authentication
All API endpoints require an `API-Key` header:
```
API-Key: your-api-key
```

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/recipes` | List all recipes (paginated) |
| GET | `/recipes/{id}` | Get recipe details |
| GET | `/categories` | List categories |
| GET | `/categories/{id}` | Get category with recipes |
| GET | `/search` | Search recipes |

See `apps/backend/routes/api.php` for complete API routes.

## Environment Variables

### Backend (.env)

Copy from `.env.example` and configure:

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=recipeshare
DB_USERNAME=root
DB_PASSWORD=

APP_KEY=
API_KEY=
```

### Frontend (.env)

```
VITE_API_URL=http://localhost:8000/api
VITE_API_KEY=your-api-key
```

## CI/CD

GitHub Actions workflows are in `.github/workflows/ci.yml`:
- Path-based triggers: `apps/backend/**` and `apps/web/**`
- Each app has independent build and test jobs

## License

[MIT](LICENSE)