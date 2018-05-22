# docker4hacker
dockerfile for hacking

This repo will hold my version of a docker container (and some CLI / other stuff)

## Building the container
```
docker build -t yossibaruch/docker4hacker <PATH TO DOCKERFILE>
```

## Running the container
```
docker run -ti -p 80:80 -p 443:443 -v /opt/docker/clients:/clients yossibaruch/docker4hacker
```
