# docker-node-service-host

Provides a convenience Docker image to run Node services under Supervisord.

## How to use

Base your image on this one to get an Alpine Linux container with latest Node.js and Supervisord pre-installed.

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
