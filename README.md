# Sanic inside Docker

Dockerization of a _Hello World_ [Sanic](https://sanicframework.org/) Application.

## Developement

### Build

    sudo docker build --build-arg UID=`id -u` --build-arg GID=`id -g` --build-arg MODE=DEV -t bacchilu/sanic-app:dev .

### Run

    sudo docker run --rm -it -v `pwd`/src:/app -p 5000:8000 bacchilu/sanic-app:dev sanic server.app --host=0.0.0.0 --dev

## Production

### Build

    sudo docker build --build-arg UID=`id -u` --build-arg GID=`id -g` -t bacchilu/sanic-app .

### Run

    sudo docker run --rm -p 80:8000 -d bacchilu/sanic-app

## docker-compose

    sudo docker-compose up -d
    sudo docker-compose down

## Docker Hub

Currently available at [https://hub.docker.com/repository/docker/bacchilu/sanic-app](https://hub.docker.com/repository/docker/bacchilu/sanic-app).

    sudo docker push bacchilu/sanic-app
    sudo docker run --rm -it -p 80:8000 -d bacchilu/sanic-app
