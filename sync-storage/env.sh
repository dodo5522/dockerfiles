VERSION=1.0
NAME='sync-storage'
REPOSITORY=dodo5522
IMAGE="${REPOSITORY}/${NAME}:${VERSION}"

SYNC_TARGET='/mnt/local/disk1/videos/private'
MOUNT_POINT='/mnt/sync_target'
BUCKET='uribou123-backup-movies'

AWS_ACCESS_KEY_ID=$(grep -A 2 -E '\[backup\]' ~/.aws/credentials | grep -E '^aws_access_key_id' | sed -e 's/^.*= *\([A-Z0-9]\)/\1/')
AWS_SECRET_ACCESS_KEY=$(grep -A 2 -E '\[backup\]' ~/.aws/credentials | grep -E '^aws_secret_access_key' | sed -e 's/^.*= *\([a-zA-Z0-9]\)/\1/')
AWS_DEFAULT_REGION=$(grep -A 2 -E 'backup\]' ~/.aws/config | grep -E '^region' | sed -e 's/^.*= *\([a-zA-Z0-9\-]\)/\1/')

