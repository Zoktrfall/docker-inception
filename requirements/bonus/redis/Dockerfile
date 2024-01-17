FROM debian:bookworm-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y redis && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /

EXPOSE 6379

RUN chmod +x /script.sh
CMD [ "/script.sh" ]