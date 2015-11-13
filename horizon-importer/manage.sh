#! /bin/bash
#
NAME="horizon-importer"
TAG="stellar-dev/${NAME}:latest"

# ---
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DKHOST=$( expr "${DOCKER_HOST}" : 'tcp://\([0-9.]*\)' )
DKHOST=${DKHOST:=127.0.0.1}

case "$1" in
  build)
    cd ${SCRIPT_PATH}
    docker -D build -t="${TAG}" .
  ;;
  run)
    docker run --rm -i -t "${NAME}" "${TAG}" /opt/run.sh
  ;;
  stop)
    docker stop ${NAME}
  ;;
  push)
    echo "Push to registry: ${TAG}"
    docker push ${TAG}
  ;;
  bash-run)
    docker run --rm -i -t --name "${NAME}" "${TAG}" /bin/bash
  ;;
  bash-exec)
    docker exec -t -i $2 /bin/bash
  ;;
  *)
    echo " Docker image: ${TAG}"
    echo " use ${0} [ build | run | stop | bash-run | bash-exec ] "
    exit 0
    ;;
esac