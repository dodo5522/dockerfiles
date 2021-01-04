#!/usr/bin/env bash

source env.sh

JENKINS_HOME="$(cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)/jenkins_home"
JENKINS_HOME_VM="/var/$(basename "${JENKINS_HOME}")"
JENKINS_ADMIN_PW="${JENKINS_HOME_VM}/secrets/initialAdminPassword"

## This sample is described on official jenkins site
# docker run \
#   --name jenkins-blueocean \
#   --rm \
#   --detach \
#   --network jenkins \
#   --env DOCKER_HOST=tcp://docker:2376 \
#   --env DOCKER_CERT_PATH=/certs/client \
#   --env DOCKER_TLS_VERIFY=1 \
#   --publish 8080:8080 \
#   --publish 50000:50000 \
#   --volume jenkins-data:/var/jenkins_home \
#   --volume jenkins-docker-certs:/certs/client:ro \
#   myjenkins-blueocean:1.0

if [ "$(docker container ls -f "name=${NAME}" 2>&1 | wc -l)" -gt 0 ]; then
  docker container rm -f "${NAME}"
fi

rm -rf "${JENKINS_HOME:?}"/*

CONTAINER_ID="$(docker run \
  --name "${NAME}" \
  --detach \
  --network "${NAME}" \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume "${JENKINS_HOME}":"${JENKINS_HOME_VM}" \
  "${IMAGE}")"

echo "docker exec ${NAME} cat ${JENKINS_ADMIN_PW}"
echo "git submodule update --init"
echo "docker container restart ${NAME}"

