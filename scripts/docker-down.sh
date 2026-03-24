#!/bin/bash

# RecipeShare Docker Down Script
# Usage: ./scripts/docker-down.sh

echo "=========================================="
echo "RecipeShare - Stopping Docker Services"
echo "=========================================="

docker-compose -f docker/docker-compose.yml down

echo ""
echo "Docker services stopped!"
echo ""