#!/usr/bin/env bash
set -e

docker compose run --rm pmacho-tomcat-init
docker compose up -d pmacho-tomcat

