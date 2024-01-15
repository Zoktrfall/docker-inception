FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget php-cli php php-mysql && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /

EXPOSE 8080

RUN chmod +x /script.sh
CMD [ "/script.sh" ]