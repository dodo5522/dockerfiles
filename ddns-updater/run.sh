#!/usr/bin/env bash

source env.sh
docker run \
  --name "${NAME}" \
  --detach \
  -e USER="${USER}" \
  -e PASSWORD="${PASSWORD}" \
  "${IMAGE}"
