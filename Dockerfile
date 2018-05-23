# Stage 1: build application
FROM node:carbon-alpine as node

# Create app directory
WORKDIR /app

# install app
COPY package*.json ./

RUN npm install

# Copy sources
COPY . .

# build the application
ARG env=production

RUN npm run build -- --prod --configuration $env
