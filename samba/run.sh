#!/usr/bin/env bash

PROGNAME="$(basename $0)"
VERSION="1.0"

function usage() {
  echo "Usage: ${PROGNAME} [OPTIONS]"
  echo
  echo "Options:"
  echo "  -h, --help                      Show this help"
  echo "      --version                   Show version"
  echo "  -u, --user ADMIN_USER           Admin user name (default: takashi)"
  echo "  -ui, --user-id ADMIN_USER_ID    Admin user ID (default: 1001)"
  echo "  -gi, --group-id ADMIN_GROUP_ID  Admin group ID (default: 1001)"
  echo "  -p                              Require admin password"
  echo
  exit 1
}

for OPT in "${@}"; do
  case "${OPT}" in
    -u | --user)
      ADMIN_USER="${2}"
      shift
      ;;
    -p | --password)
      NEED_PASSWORD=1
      shift
      ;;
    -ui | --user-id)
      ADMIN_USER_ID="${2}"
      shift
      ;;
    -gi | --group-id)
      ADMIN_GROUP_ID="${2}"
      shift
      ;;
    -w | --workspace)
      WORKSPACE="${2}"
      shift
      ;;
    -v | --version)
      echo "${VERSION}"
      ;;
    -h | --help)
      usage
      ;;
  esac
  shift
done

CONTAINER='samba'
ADMIN_USER="${ADMIN_USER:-takashi}"
ADMIN_USER_ID="${ADMIN_USER_ID:-1001}"
ADMIN_GROUP_ID="${ADMIN_GROUP_ID:-1001}"
WORKSPACE="${WORKSPACE:-URIBOU123}"

if [ -n "${NEED_PASSWORD}" ]; then
  read -p 'Enter password: ' ADMIN_PASSWORD
fi
if [ "$(docker container ls -f "name=${CONTAINER}" -q | grep -cE '[0-9][a-f]+')" ]; then
  docker container rm -f "${CONTAINER}"
fi
docker run \
  --name "${CONTAINER}" \
  --detach \
  -e TZ='Asia/Tokyo' \
  -p 139:139 \
  -p 445:445 \
  -v /mnt:/mnt \
  dperson/samba \
  -u "${ADMIN_USER};${ADMIN_PASSWORD};${ADMIN_USER_ID};${ADMIN_USER};${ADMIN_GROUP_ID}" \
  -s "private;/mnt/local;no;no;no;${ADMIN_USER}" \
  -s 'public;/mnt/public;yes;yes;yes' \
  -w "${WORKSPACE}" \
  -n \
  -S \
  -W \
  -p

