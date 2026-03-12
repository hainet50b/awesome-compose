# redoc

OpenAPI documentation viewer and linter.

- [Docker Hub (redoc)](https://hub.docker.com/r/redocly/redoc)
- [Docker Hub (cli)](https://hub.docker.com/r/redocly/cli)
- [Official Site](https://redocly.com/)

## Ports

| Container | Host | Description |
|---|---|---|
| 80 | 80 | ReDoc documentation viewer |

## Directory Structure

### Host (this repository)

```
redoc/
├── docker-compose.yml
├── openapi.yml              # Downloaded automatically if not present
├── redoc-cli-lint.sh
└── redoc-cli-build-docs.sh
```

### Container

**pmacho-redoc** (documentation viewer):

| Path | Description |
|---|---|
| /usr/share/nginx/html/openapi.yml | OpenAPI spec file to be served. Must be provided via volume mount. |

**pmacho-redoc-cli-lint / pmacho-redoc-cli-build-docs** (CLI tools):

| Path | Description |
|---|---|
| /spec | Working directory. The entire `redoc/` directory is mounted here. |

### Volume Mapping (docker-compose.yml)

| Host | Container | Service |
|---|---|---|
| ./openapi.yml | /usr/share/nginx/html/openapi.yml | pmacho-redoc |
| ./ | /spec | pmacho-redoc-cli-lint |
| ./ | /spec | pmacho-redoc-cli-build-docs |

## Environment Variables

| Variable | Value | Description |
|---|---|---|
| SPEC_URL | /openapi.yml | Path to the spec file within the viewer. |

## Custom Scripts

| Script | Description |
|---|---|
| redoc-cli-lint.sh | Lint the OpenAPI spec file. |
| redoc-cli-build-docs.sh | Generate a static HTML documentation file. |

Scripts download the [Petstore](https://petstore3.swagger.io/) spec as a sample `openapi.yml` if one is not already present. Place your own `openapi.yml` in this directory to use it instead.

## Example

View the documentation in a browser:

```
http://localhost:80
```

Lint the OpenAPI spec file:

```sh
$ ./redoc-cli-lint.sh
```

Generate static HTML documentation file:

```sh
$ ./redoc-cli-build-docs.sh
```
