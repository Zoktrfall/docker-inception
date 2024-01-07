FROM debian:buster

RUN apt -y update && apt install -y nginx && apt install openssl -y

COPY ./conf/nginx.conf /etc/nginx/sites-available/
COPY ./tools/script.sh /

EXPOSE 443

RUN chmod +x /script.sh
CMD [ "/script.sh" ]