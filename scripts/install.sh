#!/bin/bash

# RecipeShare Install Script
# Usage: ./scripts/install.sh

set -e

echo "=========================================="
echo "RecipeShare - Installing Dependencies"
echo "=========================================="

# Install Backend Dependencies
echo ""
echo "Installing Backend (Laravel) dependencies..."
cd apps/backend

if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "Created .env from .env.example"
fi

composer install --no-interaction

php artisan key:generate

echo "Backend installed successfully!"

# Return to root
cd ../..

# Install Frontend Dependencies
echo ""
echo "Installing Frontend (React) dependencies..."
cd apps/web
npm install

echo "Frontend installed successfully!"

# Return to root
cd ..

echo ""
echo "=========================================="
echo "Installation complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  - Run 'scripts/run.sh' to start the application"
echo "  - Or use Docker: 'scripts/docker-up.sh'"
echo ""