# nginx

Web server for serving static files.

- [Docker Hub](https://hub.docker.com/_/nginx)
- [Official Site](https://nginx.org/)

## Ports

| Port | Description |
|---|---|
| 80 | HTTP |

## Directory Structure

### Host (this repository)

```
nginx/
├── docker-compose.yml
└── html/
    └── index.html
```

### Container (Nginx expects)

| Path | Description |
|---|---|
| /usr/share/nginx/html | Document root for static files. |
| /etc/nginx/nginx.conf | Main configuration file. |
| /etc/nginx/conf.d/ | Additional configuration files loaded by the default `nginx.conf`. |

### Volume Mapping (docker-compose.yml)

| Host | Container |
|---|---|
| ./html | /usr/share/nginx/html (read-only) |

## Example

Returns the content of `html/index.html`:

```sh
$ curl http://localhost:80
```
