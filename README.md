# Sanic inside Docker

A Dockerfile to put a [sanic](https://sanicframework.org/) application in a Docker container.

The application inside the running containers runs with the same user of the host machine.
In this way I can edit the shared volumes with the same privileges.

## Deploy

### Build

    sudo docker build -t sanic-app .

### Run

    sudo docker run --rm -e `id -u` -p 80:8000 -d sanic-app

## Developement

### Build

    sudo docker build -t sanic-app:debug -f Dockerfile.dev .

### Run

    sudo docker run --rm -it -e `id -u` -v `pwd`:/app -p 5000:8000 sanic-app:debug

## docker-compose

    sudo docker-compose up -d
    sudo docker-compose down

Also usefull:

    sudo docker logs --follow CONTAINER