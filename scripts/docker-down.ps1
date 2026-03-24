# RecipeShare Docker Down Script (PowerShell)
# Usage: .\scripts\docker-down.ps1

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "RecipeShare - Stopping Docker Services" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

docker-compose -f docker\docker-compose.yml down

Write-Host ""
Write-Host "Docker services stopped!" -ForegroundColor Green
Write-Host ""