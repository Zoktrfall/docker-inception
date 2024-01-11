FROM debian:bookworm-slim

ENV PHP_VERSION 8.2

RUN apt update -y 
RUN apt install php-fpm php-mysql -y
RUN apt install curl -y
RUN apt install wget -y
RUN apt install -y \
	php${PHP_VERSION} \
	php${PHP_VERSION}-cgi \
	php${PHP_VERSION}-mysql \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-pdo \
	php${PHP_VERSION}-gd \
	php${PHP_VERSION}-cli \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-redis

RUN rm -rf /var/lib/apt/lists/*
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/
COPY ./tools/script.sh /

EXPOSE 9000

RUN chmod +x /script.sh
CMD [ "/script.sh" ]