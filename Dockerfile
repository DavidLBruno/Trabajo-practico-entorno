FROM alpine

RUN apk update && apk add bash imagemagick curl zip

WORKDIR /app

ADD scripts scripts

ENTRYPOINT ["bash", "/app/scripts/menu.sh"]

