#!/usr/bin/env bash

set -eu

source env.sh
docker run -d \
    -v ${SYNC_TARGET}:${MOUNT_POINT} \
    -e MOUNT_POINT="${MOUNT_POINT}" \
    -e BUCKET="${BUCKET}" \
    -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
    "${IMAGE}"

