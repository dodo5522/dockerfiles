#!/usr/bin/env bash

set -eu

source env.sh
docker run -d \
    -v ${HOME}/.aws:/root/.aws \
    -v ${SYNC_TARGET}:${MOUNT_POINT} \
    -e MOUNT_POINT="${MOUNT_POINT}" \
    -e BUCKET="${BUCKET}" \
    "${IMAGE}"

