# Stage 2: get just the important part of the application
FROM nginx:alpine

# COPY --from=node /app/dist/smart-trade/ /usr/share/nginx/html/

# remove nginx user (root) from config
RUN sed -i.bak '/user.*nginx.*/d' /etc/nginx/nginx.conf
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

# create user www-data (non root) and give ownership of needed folders
RUN adduser -D www-data
RUN mkdir -p /var/www/htdocs && \
  cp /usr/share/nginx/html/index.html /var/www/htdocs/
RUN touch /var/run/nginx.pid && \
  chown -R www-data:www-data /var/run/nginx.pid && \
  chown -R www-data:www-data /var/cache/nginx && \
  chown -R www-data:www-data /var/www/htdocs

# user non root user www-data
USER www-data

EXPOSE 8080

# cleanup images docker rmi $(docker images -f "dangling=true" -q)
