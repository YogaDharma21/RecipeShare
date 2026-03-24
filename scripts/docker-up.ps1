# RecipeShare Docker Up Script (PowerShell)
# Usage: .\scripts\docker-up.ps1

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "RecipeShare - Starting Docker Services" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Check if docker is running
$dockerCheck = docker info 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker is not running. Please start Docker first." -ForegroundColor Red
    exit 1
}

# Copy env file if it doesn't exist
if (-not (Test-Path "docker\.env")) {
    if (Test-Path "docker\.env.example") {
        Copy-Item "docker\.env.example" "docker\.env"
        Write-Host "Created docker\.env" -ForegroundColor Green
    }
}

# Start docker compose
Write-Host "Starting containers..." -ForegroundColor Yellow
docker-compose -f docker\docker-compose.yml up -d

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Docker services started!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Backend:  http://localhost:8000" -ForegroundColor White
Write-Host "Frontend: http://localhost:5173" -ForegroundColor White
Write-Host "MySQL:    localhost:3306" -ForegroundColor White
Write-Host ""
Write-Host "View logs: docker-compose -f docker\docker-compose.yml logs" -ForegroundColor Yellow
Write-Host "Stop:     .\scripts\docker-down.ps1" -ForegroundColor Yellow
Write-Host ""