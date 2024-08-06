# <img src="assets/NSS-128x128.png" align="left" />docker-node-service-host

[![Docker Image CI](https://github.com/nefarius/docker-node-service-host/actions/workflows/docker-image.yml/badge.svg)](https://github.com/nefarius/docker-node-service-host/actions/workflows/docker-image.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/containinger/docker-node-service-host)](https://hub.docker.com/r/containinger/docker-node-service-host)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/containinger/docker-node-service-host)

Provides a convenience Docker image to run [Node](https://nodejs.org/en/) services under [Supervisord](http://supervisord.org/).

## How to use

Base your image on this one to get an Alpine Linux container with latest Node.js and Supervisord pre-installed.

You can grab it directly from Docker hub via `docker pull containinger/docker-node-service-host`.

Copy a service configuration file for your service (like the example below) into `/etc/supervisor/conf.d/`:

```ini
[program:server]
directory=/my/working/directory
command=node run
user=node
stdout_logfile=/dev/stdout
redirect_stderr=true
stdout_logfile_maxbytes=0
autorestart=true
```

Optionally copy one or more script files that should run on container startup to `/docker-entrypoint-initdb.d`, they will get executed before `supervisord` runs (e.g. to perform mandatory initialization tasks).

## How to build

All base images are based on Alpine Linux but you can influence the Node version that will be used with the `NODE_VERSION` build argument.

### Examples

#### Use latest Node

```bash
docker build -t containinger/docker-node-service-host:latest --pull --build-arg NODE_VERSION=current .
```

#### Use Node v14

```bash
docker build -t containinger/docker-node-service-host:14 --pull --build-arg NODE_VERSION=14 .
```
