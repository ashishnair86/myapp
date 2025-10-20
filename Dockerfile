FROM node:24-alpine3.21 AS base

WORKDIR /app

COPY package*.json .

FROM base AS prod

ARG NODE_ENV=production

ENV NODE_ENV=$NODE_ENV

RUN --mount=type=cache,target=/root/.npm npm install

COPY . .
 
COPY .env /app/env

EXPOSE 3000

CMD ["node", "index.js"]
