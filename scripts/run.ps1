# RecipeShare Run Script (PowerShell)
# Usage: .\scripts\run.ps1

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "RecipeShare - Starting Applications" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Check if dependencies are installed
if (-not (Test-Path "apps\backend\vendor")) {
    Write-Host "Backend dependencies not found. Run install.ps1 first." -ForegroundColor Red
    exit 1
}

if (-not (Test-Path "apps\web\node_modules")) {
    Write-Host "Frontend dependencies not found. Run install.ps1 first." -ForegroundColor Red
    exit 1
}

# Function to handle cleanup on exit
function Cleanup {
    Write-Host ""
    Write-Host "Stopping servers..." -ForegroundColor Yellow
    if ($backendJob) { Stop-Job $backendJob -ErrorAction SilentlyContinue; Remove-Job $backendJob -Force -ErrorAction SilentlyContinue }
    if ($frontendJob) { Stop-Job $frontendJob -ErrorAction SilentlyContinue; Remove-Job $frontendJob -Force -ErrorAction SilentlyContinue }
    Write-Host "Servers stopped." -ForegroundColor Green
    exit
}

# Register cleanup handler
trap Cleanup Interrupt

# Start Backend
Write-Host ""
Write-Host "Starting Backend (http://localhost:8000)..." -ForegroundColor Yellow
Set-Location -Path "apps\backend"
$backendJob = Start-Job -ScriptBlock {
    param($path)
    Set-Location -Path $path
    php artisan serve --port=8000
} -ArgumentList (Get-Location).Path

# Wait for backend to start
Start-Sleep -Seconds 2

# Start Frontend
Write-Host "Starting Frontend (http://localhost:5173)..." -ForegroundColor Yellow
Set-Location -Path "..\web"
$frontendJob = Start-Job -ScriptBlock {
    param($path)
    Set-Location -Path $path
    npm run dev
} -ArgumentList (Get-Location).Path

Set-Location -Path "..\.."

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "RecipeShare is running!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Backend:  http://localhost:8000" -ForegroundColor White
Write-Host "Frontend: http://localhost:5173" -ForegroundColor White
Write-Host "API:      http://localhost:8000/api" -ForegroundColor White
Write-Host ""
Write-Host "Press Ctrl+C to stop both servers" -ForegroundColor Yellow
Write-Host ""

# Keep script running
try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
} finally {
    Cleanup
}