# Nuxt 3 Simple Docker config

> Simple Nuxt 3 Docker config with PM2, Nginx, and pnpm

Look at the [Nuxt 3 documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Features

- [x] 🐳 Docker - https://www.docker.com/
- [x] ❤️ PM2 - a daemon process manager https://pm2.keymetrics.io/
- [x] 📱 Nginx - https://www.nginx.com/
- [x] ✨ pnpm - Fast, disk space efficient package manager. https://pnpm.io/

## Setup

Make sure to install the dependencies:

```bash
# pnpm
pnpm install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# pnpm
pnpm run dev
```

## Production

Build the application for production:

```bash
# pnpm
pnpm run build
```

Locally preview production build:

```bash
# pnpm
pnpm run preview
```

## Production (Docker)

Build the application for production:

```
docker compose build \
&& docker compose down --remove-orphans \
&& docker compose up --pull always -d --wait
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.
