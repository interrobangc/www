FROM nginx:alpine

RUN apk add --update --no-cache \
        openssl

COPY docker/generate_self_signed_ssl.sh /usr/local/bin/generate_self_signed_ssl.sh

RUN /usr/local/bin/generate_self_signed_ssl.sh

COPY docker/interrobang.consulting.conf /etc/nginx/conf.d/default.conf
COPY html /var/www/interrobang.consulting/html
COPY test /var/www/interrobang.consulting/test

EXPOSE 443

WORKDIR /var/www/interrobang.consulting