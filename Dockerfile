ARG NODE_VERSION=current

FROM node:${NODE_VERSION}-alpine

COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /entrypoint.sh

RUN apk --update --no-cache add curl supervisor bash shadow && \
    mkdir /docker-entrypoint-initdb.d && \
    mkdir -p /etc/supervisor/conf.d/ && \
    chmod +x /entrypoint.sh && \
    npm update -g npm

ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
