# docker4hacker
dockerfile for hacking

This repo will hold my version of a docker container (and some CLI / other stuff)

## Building the container
```
docker build -t yossibaruch/docker4hacker <PATH TO DOCKERFILE>
```

## Running the container
```
docker run -ti  -privileged -p 80:80 -p 443:443 -v /opt/docker/clients:/clients yossibaruch/docker4hacker
```

## Some notes
* By running docker run with the –privileged we grant this container elevated privileged or access to devices directly.
* Containers can also be used as sandboxes for testing applications. Spin up a default Debian container then install an application on it for testing without worrying about having to uninstall it afterwards.
