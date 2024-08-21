ARG NODE_VERSION=20.15.0

FROM node:${NODE_VERSION}-alpine as base

ARG PORT=3000

ENV NODE_ENV=production

WORKDIR /app
# Build
FROM base as builder

RUN npm install -g pnpm

COPY --link package.json .
COPY --link pnpm-lock.yaml .

RUN pnpm install --production=false

COPY --link . .

RUN pnpm build

# Run
FROM base

ENV PORT=$PORT

COPY --from=builder /app/.output /app/.output
# Optional, only needed if you rely on unbundled dependencies
# COPY --from=builder /app/node_modules /app/node_modules

COPY --from=builder /app/docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
