#!/usr/bin/env sh
set -e

if [ -f /tmp/certs/.done ]; then
  exit 0
fi

mkdir -p /tmp/certs
chown -R 1000:1000 /tmp/certs

/usr/share/elasticsearch/bin/elasticsearch-certutil ca --silent --pem \
  --out /tmp/certs/ca.zip
unzip -qo /tmp/certs/ca.zip -d /tmp/certs

/usr/share/elasticsearch/bin/elasticsearch-certutil cert --silent --pem \
  --in /usr/local/share/pmacho-elasticsearch/config/instances.yml \
  --ca-cert /tmp/certs/ca/ca.crt \
  --ca-key /tmp/certs/ca/ca.key \
  --out /tmp/certs/certs.zip
unzip -qo /tmp/certs/certs.zip -d /tmp/certs

rm -f /tmp/certs/*.zip

touch /tmp/certs/.done

