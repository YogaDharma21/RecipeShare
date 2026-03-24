#!/bin/bash

# RecipeShare Run Script
# Usage: ./scripts/run.sh

set -e

echo "=========================================="
echo "RecipeShare - Starting Applications"
echo "=========================================="

# Check if dependencies are installed
if [ ! -d "apps/backend/vendor" ]; then
    echo "Backend dependencies not found. Run install.sh first."
    exit 1
fi

if [ ! -d "apps/web/node_modules" ]; then
    echo "Frontend dependencies not found. Run install.sh first."
    exit 1
fi

# Start Backend in background
echo ""
echo "Starting Backend (http://localhost:8000)..."
cd apps/backend
php artisan serve --port=8000 &
BACKEND_PID=$!

# Wait a moment for backend to start
sleep 2

# Start Frontend
echo "Starting Frontend (http://localhost:5173)..."
cd ../web
npm run dev &
FRONTEND_PID=$!

echo ""
echo "=========================================="
echo "RecipeShare is running!"
echo "=========================================="
echo "Backend:  http://localhost:8000"
echo "Frontend: http://localhost:5173"
echo "API:      http://localhost:8000/api"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Wait for either process to stop
wait $BACKEND_PID