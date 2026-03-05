#!/usr/bin/env bash
set -eu

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
docker_compose_file='docker-compose.yml'
service='pmacho-redoc'
openapi_url='https://petstore3.swagger.io/api/v3/openapi.json'

[ -f "${script_dir}/openapi.yml" ] || curl -o "${script_dir}/openapi.yml" "$openapi_url"

docker compose \
  --project-directory "$script_dir" \
  -f "${script_dir}/${docker_compose_file}" \
  up -d --force-recreate "$service"

