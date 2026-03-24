# Gemini Context for RecipeShare

## Project Overview

RecipeShare is a **polyglot monorepo** containing:
- **Backend**: Laravel 11 API with Filament admin panel (PHP)
- **Frontend**: React 18 with TypeScript and Vite (JavaScript/TypeScript)

## Tech Stack

| App | Framework | Language | Key Dependencies |
|-----|-----------|----------|------------------|
| `apps/backend` | Laravel 11 | PHP 8.2 | Filament 3.x, MySQL |
| `apps/web` | React 18 + Vite | TypeScript | Tailwind, Axios, React Router |

## Project Structure

```
apps/
├── backend/          # Laravel 11 API
│   ├── app/         # Controllers, Models, Services
│   ├── routes/      # api.php, web.php
│   ├── database/    # Migrations, Seeders
│   ├── config/      # Laravel config
│   └── tests/       # Pest tests
│
└── web/             # React frontend
    ├── src/
    │   ├── components/   # UI components
    │   ├── pages/        # Route pages
    │   ├── services/     # API calls (Axios)
    │   ├── hooks/        # Custom hooks
    │   └── types/        # TypeScript interfaces
    └── public/           # Static assets
```

## Key Principles

1. **No Shared Code**: Backend and web are completely independent. Do NOT create shared code between them.

2. **Each App Lives Alone**:
   - Backend uses Composer (PHP), `php artisan` commands
   - Frontend uses npm, `npm run dev/build/lint`

3. **API Communication**:
   - Frontend calls backend via REST API at `/api/*`
   - All endpoints require `API-Key` header
   - Base URL: `http://localhost:8000/api`

4. **Environment Variables**:
   - Backend: `.env` (DB connection, APP_KEY, API_KEY)
   - Frontend: `.env` (`VITE_API_URL`, `VITE_API_KEY`)

## Important Patterns

### Backend Routes
- API routes in `apps/backend/routes/api.php`
- Protected by API key middleware
- Controllers in `apps/backend/app/Http/Controllers/`

### Frontend API Service
- Axios instance in `apps/web/src/services/api.ts`
- Types in `apps/web/src/types/`
- Components in `apps/web/src/components/`

### Database
- Migrations in `apps/backend/database/migrations/`
- Models in `apps/backend/app/Models/`

## Development Commands

### Backend
```bash
cd apps/backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve
```

### Frontend
```bash
cd apps/web
npm install
npm run dev
npm run build
```

## Important Notes

- This is a recipe sharing platform with features: recipes, categories, authors, PDF download, video tutorials
- Backend exposes REST API; frontend consumes it
- Use `.env.example` files as reference for required environment variables
- Tests use Pest in backend, ESLint in frontend