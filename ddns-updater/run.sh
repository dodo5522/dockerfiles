#!/usr/bin/env bash

if ! [ -f .env ]; then
  echo Error! Make .env based on .env.sample
  exit 1
fi

source .env

docker run \
  --name "${NAME}" \
  --restart unless-stopped \
  --detach \
  --env-file .env \
  "${IMAGE}"

