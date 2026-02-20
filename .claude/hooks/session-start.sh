#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

echo "==> Installing shared package dependencies..."
cd shared && npm install && npm run build && cd ..

echo "==> Installing frontend dependencies..."
cd frontend && npm install && cd ..

echo "==> Installing backend dependencies..."
cd backend && npm install && cd ..

echo "==> All dependencies installed."
