FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vsftpd && rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /
COPY ./tools/script.sh /

EXPOSE 21

RUN chmod +x /script.sh
CMD [ "/script.sh" ]