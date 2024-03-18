FROM php:8.2.0-fpm as php

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql

COPY . .

COPY --from=composer  /usr/bin/composer /usr/bin/composer

EXPOSE 80
# Adjust user permission & group.
RUN usermod --uid 1000 www-data
RUN groupmod --gid 1000  www-data
