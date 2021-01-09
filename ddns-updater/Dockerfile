FROM alpine
MAINTAINER Takashi Ando <dodo5522@gmail.com>

# user to login DDNS service
ENV USER=""
# password to login DDNS service
ENV PASSWORD=""
# interval hours
ENV INTERVAL="6"

USER root
RUN apk add --no-cache --virtual .mydns curl

COPY notify-ip.sh /usr/bin/
ENTRYPOINT while true; do sleep $((${INTERVAL}*3600)); sh /usr/bin/notify-ip.sh ${USER} ${PASSWORD}; done
