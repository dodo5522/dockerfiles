#!/usr/bin/env bash
set -eu

# Add the cron job
crontab -l | { cat;
    echo "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}";
    echo "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}";
    echo "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}";
    echo "MOUNT_POINT=${MOUNT_POINT}";
    echo "BUCKET=${BUCKET}";
    echo "0 0 * * * /usr/local/bin/aws s3 sync --storage-class GLACIER_IR ${MOUNT_POINT} s3://${BUCKET}";
} | crontab -

# Run cron with frontend
crond -n

