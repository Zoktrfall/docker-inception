FROM debian:buster

ENV PHP_VERSION 7.3

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

COPY ./tools/script.sh /
COPY ./conf/wp-config.php /

RUN chmod +x /script.sh
CMD [ "/script.sh" ]