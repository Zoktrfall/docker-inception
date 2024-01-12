FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt install -y nginx && apt install openssl -y
RUN rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/sites-available/
COPY ./tools/script.sh /

EXPOSE 443

RUN chmod +x /script.sh
CMD [ "/script.sh" ]