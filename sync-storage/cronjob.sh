#!/usr/bin/env bash
set -eu

aws s3 sync --storage-class GLACIER_IR "${MOUNT_POINT}/2019" "s3://${BUCKET}/2019"

