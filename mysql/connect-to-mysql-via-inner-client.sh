#!/usr/bin/env bash
set -eu

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
docker_compose_file='docker-compose.yml'
service='pmacho-mysql'

docker compose \
  --project-directory "$script_dir" \
  -f "${script_dir}/${docker_compose_file}" \
  exec "$service" sh -c '
    mysql \
      -h localhost \
      -u${MYSQL_USER:-pmacho_user} \
      -p${MYSQL_PASSWORD:-pmacho_password} \
      ${MYSQL_DATABASE:-pmacho_db}
  '

