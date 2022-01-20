#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/../../scripts/utils.sh

DOCKER_COMPOSE_FILE_OVERRIDE=$1
if [ -f "${DOCKER_COMPOSE_FILE_OVERRIDE}" ]
then

  docker-compose -f ../../environment/mdc-plaintext/docker-compose.yml -f ../../environment/mdc-kerberos/docker-compose.kerberos.yml -f ${DOCKER_COMPOSE_FILE_OVERRIDE} down -v --remove-orphans
else
  docker-compose -f ../../environment/mdc-plaintext/docker-compose.yml -f ../../environment/mdc-kerberos/docker-compose.kerberos.yml down -v --remove-orphans
fi
