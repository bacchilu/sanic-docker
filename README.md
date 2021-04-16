# Sanic inside Docker

A Dockerfile to put a [sanic](https://sanicframework.org/) application in a Docker container.

## Build

    sudo docker build -t sanic-app .

## Run

    sudo docker run --rm -p 80:8000 -d sanic-app
