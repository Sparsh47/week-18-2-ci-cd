FROM node:alpine

WORKDIR /app

COPY package.json package-lock.json turbo.json tsconfig.json ./
COPY apps ./apps
COPY packages ./packages

RUN npm ci --prefer-offline --no-audit

RUN npm run db:generate

RUN npm run build

CMD ["npm", "run", "start-user-app"]