# Sanic inside Docker

A Dockerfile to put a [sanic](https://sanicframework.org/) application in a Docker container.

The application inside the running containers runs with the same user of the host machine.
In this way I can edit the shared volumes with the same privileges.

## Deploy

### Build

    sudo docker build --build-arg UID=`id -u` --build-arg GID=`id -g` -t bacchilu/sanic-app .
    sudo docker push bacchilu/sanic-app

### Run

    sudo docker run --rm -p 80:8000 -d bacchilu/sanic-app

## Developement

### Build

    sudo docker build --build-arg UID=`id -u` --build-arg GID=`id -g` -t bacchilu/sanic-app:debug -f Dockerfile.dev .

### Run

    sudo docker run --rm -it -v `pwd`/src:/app -p 5000:8000 bacchilu/sanic-app:debug

## docker-compose

    sudo docker-compose up -d
    sudo docker-compose down

Also usefull:

    sudo docker logs --follow CONTAINER

## Docker Hub

Currently available at [https://hub.docker.com/repository/docker/bacchilu/sanic-app](https://hub.docker.com/repository/docker/bacchilu/sanic-app).

    sudo docker run --rm -it -p 80:8000 -d bacchilu/sanic-app

https://bacchilu.github.io/hnews/#/34940181
