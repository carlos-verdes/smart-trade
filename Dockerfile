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

# Stage 2: get just the important part of the application
FROM nginx:alpine

COPY --from=node /app/dist/smart-trade/ /usr/share/nginx/html/

COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
