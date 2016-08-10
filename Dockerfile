FROM debian:jessie

RUN apt-get clean && apt-get update \
    && apt-get install -qqy cron \
    && rm -rf /var/lib/apt/lists/*

RUN mkfifo --mode 0666 /var/log/cron.log

COPY entrypoint.sh /

CMD ["entrypoint.sh"]
