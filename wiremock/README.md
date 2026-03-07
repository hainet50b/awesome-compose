# wiremock

HTTP stubbing server for API mocking.

- [Docker Hub](https://hub.docker.com/r/wiremock/wiremock)
- [Official Site](https://wiremock.org/)

## Ports

| Port | Description |
|---|---|
| 8080 | WireMock HTTP endpoint |

## Directory Structure

### Host (this repository)

```
wiremock/
├── docker-compose.yml
├── mappings/
│   └── users-get.json
└── __files/
    └── users-get-response.json
```

### Container (WireMock expects)

| Path | Description |
|---|---|
| /home/wiremock/mappings | Stub definitions. Each JSON file describes a request matcher and its response. |
| /home/wiremock/__files | Static response bodies. Referenced from stubs via `bodyFileName`. |

### Volume Mapping (docker-compose.yml)

| Host | Container |
|---|---|
| ./mappings | /home/wiremock/mappings |
| ./__files | /home/wiremock/__files |

## Example

The included stub maps `GET /users` to a JSON response:

```sh
$ curl http://localhost:8080/users
[{"id":1,"name":"hainet50b"},{"id":2,"name":"programacho.com"}]
```

The admin API provides runtime information and stub management:

```sh
$ curl http://localhost:8080/__admin
```
