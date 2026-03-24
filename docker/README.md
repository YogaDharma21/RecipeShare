# Docker Configuration

Docker configuration for RecipeShare monorepo.

## Services

| Service | Container | Port | Description |
|---------|-----------|------|-------------|
| MySQL | recipeshare-mysql | 3306 | Database |
| Backend | recipeshare-backend | 8000 | Laravel API |
| Frontend | recipeshare-web | 5173 | React dev server |

## Usage

### Quick Start

```bash
# Linux/Mac
./scripts/docker-up.sh

# Windows
.\scripts\docker-up.ps1
```

### Manual Commands

**Start services:**
```bash
docker-compose -f docker/docker-compose.yml up -d
```

**View logs:**
```bash
docker-compose -f docker/docker-compose.yml logs -f
```

**Stop services:**
```bash
# Linux/Mac
./scripts/docker-down.sh

# Windows
.\scripts\docker-down.ps1
```

## Environment Variables

Create `docker/.env` from the example:

```env
VITE_API_KEY=your-api-key-here
```

## Notes

- MySQL data is persisted in Docker volume
- Backend storage is mounted for logs/cache
- Frontend uses hot reload via volume mount