FROM nginx:alpine

COPY docker/interrobang.consulting.conf /etc/nginx/conf.d/default.conf
COPY html /var/www/interrobang.consulting/html
