FROM debian:buster

RUN apt update -y 
RUN apt install php-fpm php-mysql -y
RUN apt install curl -y
RUN apt install -y \
	curl \
	wget \
	php${PHP_VERSION} \
	php${PHP_VERSION}-cgi \
	php${PHP_VERSION}-mysql \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-pdo \
	php${PHP_VERSION}-gd \
	php${PHP_VERSION}-cli \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-redis \
	&& rm -rf /var/lib/apt/lists/*


COPY ./tools/script.sh /
COPY ./conf/wp-config.php /


CMD [ "/script.sh" ]