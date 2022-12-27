#!/usr/bin/env bash

source .env.sample

ADMIN_USER="${ADMIN_USER:-takashi}"
ADMIN_USER_ID="${ADMIN_USER_ID:-1001}"
ADMIN_GROUP_ID="${ADMIN_GROUP_ID:-1001}"
WORKSPACE="${WORKSPACE:-URIBOU123}"

read -rp 'Enter password: ' ADMIN_PASSWORD

docker run \
  --name "${NAME}" \
  --restart unless-stopped \
  --detach \
  -e TZ='Asia/Tokyo' \
  -p 139:139 \
  -p 445:445 \
  -v /mnt:/mnt \
  "${IMAGE}" \
  -u "${ADMIN_USER};${ADMIN_PASSWORD};${ADMIN_USER_ID};${ADMIN_USER};${ADMIN_GROUP_ID}" \
  -s "private;/mnt/local;no;no;no;${ADMIN_USER}" \
  -s 'public;/mnt/public;yes;yes;yes' \
  -w "${WORKSPACE}" \
  -n \
  -S \
  -W \
  -p

