#!/bin/bash

echo "🚀 Starting publish process..."

# Go up one level to the main project directory
cd .. || exit 1

echo "🏗️  Building with Quarto..."
quarto render

echo "📤 Pushing to GitHub..."
git add .
git commit -m "Auto-publish $(date)"
git push

echo "✅ Publish process complete!"