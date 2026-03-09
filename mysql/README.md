# mysql

Relational database with a companion client container.

- [Docker Hub](https://hub.docker.com/_/mysql)
- [Official Site](https://www.mysql.com/)

## Ports

| Container | Host | Description |
|---|---|---|
| 3306 | - | MySQL protocol |

## Directory Structure

### Host (this repository)

```
mysql/
├── docker-compose.yml
├── .env.example
├── initdb.d/
│   ├── 001-create-tables.sql
│   └── 002-insert-data.sql
├── connect-to-mysql.sh
├── connect-to-mysql-via-inner-client.sh
└── enter-mysql-client-container.sh
```

### Container (MySQL expects)

| Path | Description |
|---|---|
| /var/lib/mysql | Data directory. Persisted via a named volume. |
| /etc/mysql/conf.d/ | Custom configuration files (`.cnf`). Loaded after the default config. |
| /docker-entrypoint-initdb.d/ | SQL or shell scripts executed on first startup only. Files are processed in alphabetical order. |

### Volume Mapping (docker-compose.yml)

| Host | Container |
|---|---|
| pmacho-mysql-volume (named) | /var/lib/mysql |
| ./initdb.d | /docker-entrypoint-initdb.d (read-only) |

## Environment Variables

Configured via `.env` file (see `.env.example`):

| Variable | Default | Description |
|---|---|---|
| MYSQL_ROOT_PASSWORD | changeme | Root user password |
| MYSQL_DATABASE | pmacho_db | Database created on first startup |
| MYSQL_USER | pmacho_user | Non-root user created on first startup |
| MYSQL_PASSWORD | pmacho_password | Password for the non-root user |

## Custom Scripts

| Script | Description |
|---|---|
| connect-to-mysql.sh | Start a new client container and connect to the MySQL server. |
| connect-to-mysql-via-inner-client.sh | Connect to the database from the running server container. |
| enter-mysql-client-container.sh | Start a new client container with a bash shell. |

## Example

Connect to the database via a new client container:

```sh
$ ./connect-to-mysql.sh
mysql>
```

Connect to the database from the running server container:

```sh
$ ./connect-to-mysql-via-inner-client.sh
mysql>
```
