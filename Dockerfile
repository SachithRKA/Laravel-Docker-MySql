FROM php:8.1.27-fpm-alpine3.18


RUN apk add composer
RUN apk add bash zlib
RUN apk add php-session
RUN apk add --no-cache php81 \
    php81-common \
    php81-fpm \
    php81-pdo \
    php81-opcache \
    php81-zip \
    php81-phar \
    php81-iconv \
    php81-cli \
    php81-curl \
    php81-openssl \
    php81-mbstring \
    php81-tokenizer \
    php81-fileinfo \
    php81-json \
    php81-xml \
    php81-xmlwriter \
    php81-simplexml \
    php81-dom \
    php81-pdo_mysql \
    php81-pdo_sqlite \
    php81-tokenizer \
    php81-pecl-redis

# RUN docker-php-ext-install mysqli pdo_mysql
# RUN docker-php-ext-enable mysqli mysql

RUN /usr/local/bin/docker-php-ext-install pdo pdo_mysql
RUN /usr/local/bin/docker-php-ext-install -j5 mysqli pdo pdo_mysql


#RUN mkdir -p /var/www/html/app
#WORKDIR /var/www/html
#VOLUME /var/www/html

WORKDIR /root
VOLUME /root

# COPY ./app .

# RUN composer update
# RUN composer install

EXPOSE 8000
EXPOSE 9000
ENV HOSTNAME '0.0.0.0'

CMD ["php", "artisan", "serve" , "--host=0.0.0.0", "--port=8000"]
