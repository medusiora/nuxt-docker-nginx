#!/bin/sh
set -e

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please install npm before running this script."
    exit 1
fi

echo "Install PM2 globally"
npm install pm2@latest -g

# Define PORT or pass it as an argument
export PORT=${PORT:-3000}

tee /app/ecosystem.config.js <<EOF
module.exports = {
  apps: [
    {
      name: 'nuxt',
      port: '${PORT}',
      exec_mode: 'cluster',
      instances: 'max',
      script: './.output/server/index.mjs',
    },
  ],
};
EOF

# Check if the project directory exists
if [ -d "/app/.output" ]; then
  echo "Starting PM2"
  pm2-runtime start ecosystem.config.js
  pm2-runtime ls
  pm2-runtime logs
else
  echo "Error: Project directory not found."
  exit 1
fi

exec docker-pm2-entrypoint "$@"
