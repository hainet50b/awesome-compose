#!/usr/bin/env bash
docker compose exec pmacho-elasticsearch \
  /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic -i

