# Stage 2: get just the important part of the application
FROM nginx:alpine

# COPY --from=node /app/dist/smart-trade/ /usr/share/nginx/html/

# remove nginx user (root) from config
RUN sed -i.bak '/user.*nginx.*/d' /etc/nginx/nginx.conf
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

# create folders and give global access (Openshift use random UID)
RUN mkdir -p /var/www/htdocs && \
  cp /usr/share/nginx/html/index.html /var/www/htdocs/
RUN touch /var/run/nginx.pid && \
  chmod -R a+rwx /var/run/nginx.pid && \
  chmod -R a+rwx /var/cache/nginx && \
  chmod -R a+rwx /var/www/htdocs

EXPOSE 8080

# cleanup images docker rmi $(docker images -f "dangling=true" -q)
