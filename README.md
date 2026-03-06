# awesome-compose

A personal collection of Docker Compose configurations for quick reference and reuse.

## Compositions

### Web Servers

| Directory | Description | Ports |
|---|---|---|
| [nginx](./nginx/) | Nginx serving static files | 80 |
| [tomcat](./tomcat/) | Apache Tomcat with init setup | 8080 |

### Databases

| Directory | Description | Ports |
|---|---|---|
| [mysql](./mysql/) | MySQL with client container | 3306 |

### Logging & Monitoring

| Directory | Description | Ports |
|---|---|---|
| [elasticsearch](./elasticsearch/) | Elasticsearch + Kibana + Filebeat with TLS/security | 9200, 5601, 80 |
| [elasticsearch-simple](./elasticsearch-simple/) | Elasticsearch + Kibana (minimal setup) | 9200, 5601 |

### API Documentation

| Directory | Description | Ports |
|---|---|---|
| [redoc](./redoc/) | OpenAPI documentation viewer and linter (ReDoc) | 80 |

### Testing & Mocking

| Directory | Description | Ports |
|---|---|---|
| [wiremock](./wiremock/) | WireMock HTTP stubbing | 8080 |

## Usage

Each directory includes a subset of the following helper scripts depending on its needs:

```sh
cd <directory>
./docker-compose-up.sh        # Start services
./docker-compose-down.sh      # Stop and remove services
./docker-compose-down-v.sh    # Stop and remove services including volumes
./docker-compose-start.sh     # Start existing containers
./docker-compose-stop.sh      # Stop running containers
./docker-compose-restart.sh   # Restart services
./docker-compose-logs.sh      # View logs
./docker-compose-exec.sh      # Start a shell session in a running container
```

## Templates

The [_templates](./_templates/) directory contains reusable helper script templates for bootstrapping new compositions.
