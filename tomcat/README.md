# tomcat

Java application server.

- [Docker Hub](https://hub.docker.com/_/tomcat)
- [Official Site](https://tomcat.apache.org/)

## Ports

| Container | Host | Description |
|---|---|---|
| 8080 | 8080 | Tomcat HTTP endpoint |

## Directory Structure

### Host (this repository)

```
tomcat/
├── docker-compose.yml
├── webapps/
├── conf/
├── reset-conf-and-webapps-dry-run.sh
└── reset-conf-and-webapps.sh
```

### Container (Tomcat expects)

| Path | Description |
|---|---|
| /usr/local/tomcat/webapps | Deployed web applications. |
| /usr/local/tomcat/conf | Server configuration files. |
| /usr/local/tomcat/webapps.dist | Default web applications shipped with the image. Not used at runtime. |

### Volume Mapping (docker-compose.yml)

| Host | Container |
|---|---|
| ./webapps | /usr/local/tomcat/webapps |
| ./conf | /usr/local/tomcat/conf |

## Init Container

The Tomcat Docker image ships with an empty `/usr/local/tomcat/webapps` directory. Default web applications (such as the ROOT welcome page) are placed in `/usr/local/tomcat/webapps.dist` instead. Similarly, configuration files are in `/usr/local/tomcat/conf`.

Since this composition bind-mounts `./webapps` and `./conf` from the host, these directories would be empty on first use. The `pmacho-tomcat-init` service solves this by copying the defaults from the image to the host before the main Tomcat container starts:

| Source (in image) | Destination (on host) | Condition |
|---|---|---|
| /usr/local/tomcat/webapps.dist/ROOT | ./webapps/ROOT | Copied if `./webapps/ROOT` does not exist |
| /usr/local/tomcat/conf/* | ./conf/ | Copied if `./conf/server.xml` does not exist |

Once copied, the files can be freely edited on the host. The init container will not overwrite existing files on subsequent startups.

## Custom Scripts

| Script | Description |
|---|---|
| reset-conf-and-webapps-dry-run.sh | Preview files that would be deleted by the reset script. |
| reset-conf-and-webapps.sh | Delete `conf/` and `webapps/` to restore defaults on next startup. Requires `sudo`. |

## Example

Access the default Tomcat welcome page:

```sh
$ curl http://localhost:8080
```

Preview files that would be deleted by the reset script:

```sh
$ ./reset-conf-and-webapps-dry-run.sh
Would remove conf/Catalina/
Would remove conf/catalina.properties
Would remove conf/context.xml
Would remove conf/jaspic-providers.xml
Would remove conf/jaspic-providers.xsd
Would remove conf/logging.properties
Would remove conf/server.xml
Would remove conf/tomcat-users.xml
Would remove conf/tomcat-users.xsd
Would remove conf/web.xml
Would remove webapps/ROOT/
```

Delete `conf/` and `webapps/` to restore defaults on next startup. Requires `sudo`:

```sh
$ ./reset-conf-and-webapps.sh
Removing conf/Catalina/
Removing conf/catalina.properties
Removing conf/context.xml
Removing conf/jaspic-providers.xml
Removing conf/jaspic-providers.xsd
Removing conf/logging.properties
Removing conf/server.xml
Removing conf/tomcat-users.xml
Removing conf/tomcat-users.xsd
Removing conf/web.xml
Removing webapps/ROOT/
```
