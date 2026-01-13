#!/usr/bin/env sh
set -eu

for i in $(seq 1 10); do
  curl -s --cacert /usr/local/share/pmacho-elasticsearch/certs/ca/ca.crt https://pmacho-elasticsearch:9200 > /dev/null && break
  sleep 2
done

curl -fsS --cacert /usr/local/share/pmacho-elasticsearch/certs/ca/ca.crt \
  -u "elastic:${ELASTIC_PASSWORD}" \
  -XPOST https://pmacho-elasticsearch:9200/_security/user/kibana_system/_password \
  -H 'Content-Type: application/json' \
  -d "{\"password\": \"${KIBANA_SYSTEM_PASSWORD}\"}" > /dev/null

