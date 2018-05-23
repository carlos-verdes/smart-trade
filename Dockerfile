# Stage 2: get just the important part of the application
FROM nginx:alpine

# COPY --from=node /app/dist/smart-trade/ /usr/share/nginx/html/

COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# cleanup images docker rmi $(docker images -f "dangling=true" -q)
