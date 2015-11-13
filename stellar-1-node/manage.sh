#! /bin/bash
#
# Manage docker-compose
#

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DKHOST=$( expr "${DOCKER_HOST}" : 'tcp://\([0-9.]*\)' )
DKHOST=${DKHOST:=127.0.0.1}

function_exec () {
  if [[ "${ENV}" == "local" ]]; then
    $1
  else
    docker-machine ssh dev "$1"
  fi
}

case "$1" in
  ps)
    docker-compose ps
  ;;
  rm)
    docker-compose rm
  ;;
  up)
    docker-compose build
    docker-compose up
  ;;
  stop)
    docker-compose stop
  ;;
  logs)
    docker-compose logs $2
  ;;
  data)
    function_exec "ls -lhR /opt/docker-persistent-data"
  ;;
  bash)
    docker exec -t -i $2 /bin/bash
  ;;
  rsc)
    CONTAINERS=$(docker ps -a -q)
    if [[ -n "${CONTAINERS}" ]]; then
      echo " * Remove stopped containers: $CONTAINERS"
      docker rm ${CONTAINERS}
    else
      echo " * No stopped containers"
    fi
  ;;
  rui)
    IMAGES=$(docker images | grep "^<none>" | awk '{print $3}')
    if [[ -n "$IMAGES" ]]; then
      echo " * Remove untagged images: ${IMAGES}"
      docker rmi $IMAGES
    else
      echo " * No untagged images"
    fi
  ;;
  *)
    echo " use ${0} [ ps | up | stop | logs [dockername] | bash [dockerid] | rsc | rui "
    exit 0
    ;;
esac