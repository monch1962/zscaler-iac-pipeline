#!/bin/bash

echo "🚀 Bootstrap: Setting up Zscaler DevSecOps Toolkit"

# Check for Docker
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed. Please install Docker before continuing."
  exit 1
fi

# Check for git
if ! command -v git &> /dev/null; then
  echo "❌ Git is not installed. Please install Git before continuing."
  exit 1
fi

# Clone repo if needed
if [ ! -d ".git" ]; then
  echo "📥 Cloning repo..."
  git clone https://your-repo-url .
fi

# Build Docker image
echo "🐳 Building Docker container..."
docker-compose build

# Optional: Set up pre-commit
if command -v pre-commit &> /dev/null; then
  echo "🔧 Installing pre-commit hooks..."
  pre-commit install
else
  echo "⚠️ pre-commit not found. You can install it with: pip install pre-commit"
fi

echo "✅ Done! Run 'docker-compose run zscaler-devsecops' to get started."
