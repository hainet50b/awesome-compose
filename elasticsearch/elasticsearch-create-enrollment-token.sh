#!/usr/bin/env bash
docker compose exec pmacho-elasticsearch \
  /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

