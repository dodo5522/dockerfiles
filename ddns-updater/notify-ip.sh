#!/bin/sh

if [ ${#} -lt 2 ]; then
    echo 'usage: notify-ip-mydns.sh user password [force]'
    exit 1
fi

DIR_TMP="/var/tmp"
FILE_OLD="${DIR_TMP}/old_ip"
USER="${1}"
PASSWORD="${2}"
FORCE_UPDATE="${3}"
IP_OLD=$(if [ -f "${FILE_OLD}" ]; then cat ${FILE_OLD}; fi)

if [ -z "${FORCE_UPDATE}" ]; then
    IP_CURRENT=$(curl -s inet-ip.info)
    if [ "${IP_CURRENT}" != "${IP_OLD}" ]; then
        curl -s -u "${USER}:${PASSWORD}" https://ipv4.mydns.jp/login.html
#       curl -s -u "${USER}:${PASSWORD}" https://ipv6.mydns.jp/login.html
        echo -n "${IP_CURRENT}" > "${FILE_OLD}"
        echo "Update ${FILE_OLD} with ${IP_CURRENT}"
    else
        echo "Keep ${FILE_OLD} with ${IP_CURRENT}"
    fi
else
    curl -s -u "${USER}:${PASSWORD}" https://ipv4.mydns.jp/login.html
#   curl -s -u "${USER}:${PASSWORD}" https://ipv6.mydns.jp/login.html
    echo "Forcefully update IP"
fi

