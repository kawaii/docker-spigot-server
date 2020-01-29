# docker-spigot-server
Dockerfile using my Spigot builder image to spin up a server instance.

## Usage

The Spigot `server.properties` file is generated dynamically by the [entrypoint](docker-entrypoint.sh#L10-L44) each time the container is started. In the case a variable is not provided, safe defaults are interpolated and used.

### ... via [`docker container run`](https://docs.docker.com/engine/reference/commandline/container_run/)

```
docker container run -p 25565:25565 -e SPIGOT_AGREE_EULA=true kawaii/spigot-server:1.15.2
```

### ... via [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) or [`docker-compose`](https://github.com/docker/compose)

```yaml
services:
  spigot:
    environment:
      SPIGOT_AGREE_EULA: 'true'
      SPIGOT_LEVEL_NAME: dockercraft
    image: kawaii/spigot-server:1.15.2
    ports:
    - 0.0.0.0:25565:25565/tcp
version: '3.7'
```

## Persisting Data

_To be completed soon™._

## Installing Plugins

_To be completed soon™._
