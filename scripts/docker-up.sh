#!/bin/bash

# RecipeShare Docker Up Script
# Usage: ./scripts/docker-up.sh

echo "=========================================="
echo "RecipeShare - Starting Docker Services"
echo "=========================================="

# Check if docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Please start Docker first."
    exit 1
fi

# Copy env file if it doesn't exist
if [ ! -f "docker/.env" ]; then
    cp docker/.env.example docker/.env 2>/dev/null || echo "Created docker/.env"
fi

# Start docker compose
echo "Starting containers..."
docker-compose -f docker/docker-compose.yml up -d

echo ""
echo "=========================================="
echo "Docker services started!"
echo "=========================================="
echo "Backend:  http://localhost:8000"
echo "Frontend: http://localhost:5173"
echo "MySQL:    localhost:3306"
echo ""
echo "View logs: docker-compose -f docker/docker-compose.yml logs"
echo "Stop:     ./scripts/docker-down.sh"
echo ""