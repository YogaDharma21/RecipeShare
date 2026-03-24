# RecipeShare Install Script (PowerShell)
# Usage: .\scripts\install.ps1

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "RecipeShare - Installing Dependencies" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Install Backend Dependencies
Write-Host ""
Write-Host "Installing Backend (Laravel) dependencies..." -ForegroundColor Yellow

Set-Location -Path "apps\backend"

if (-not (Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    Write-Host "Created .env from .env.example" -ForegroundColor Green
}

composer install --no-interaction

php artisan key:generate

Write-Host "Backend installed successfully!" -ForegroundColor Green

# Return to root
Set-Location -Path "..\.."

# Install Frontend Dependencies
Write-Host ""
Write-Host "Installing Frontend (React) dependencies..." -ForegroundColor Yellow

Set-Location -Path "apps\web"
npm install

Write-Host "Frontend installed successfully!" -ForegroundColor Green

# Return to root
Set-Location -Path ".."

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Installation complete!" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  - Run 'scripts\run.ps1' to start the application" -ForegroundColor White
Write-Host "  - Or use Docker: 'scripts\docker-up.ps1'" -ForegroundColor White
Write-Host ""