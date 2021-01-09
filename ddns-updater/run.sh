#!/usr/bin/env bash

source env.sh
docker run --rm -d -e USER="${USER}" -e PASSWORD="${PASSWORD}" "${IMAGE}"

