#!/usr/bin/env bash
set -eu

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
docker_compose_file='docker-compose.yml'
service='pmacho-vacuum-dashboard'

docker compose \
  --project-directory "$script_dir" \
  -f "${script_dir}/${docker_compose_file}" \
  run --rm -it "$service"

