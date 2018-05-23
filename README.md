# docker4hacker
dockerfile for hacking

This repo will hold my version of a docker container (and some CLI / other stuff)

## Clone this repo to your host (/opt in this example)
```
cd /opt
git clone https://github.com/yossibaruch/docker4hacker.git
```

## Building the container (work directory is /opt/docker in this example)
```
cd /opt/docker
docker build -t yossibaruch/docker4hacker <PATH TO DOCKERFILE>
```

## Running the container (work directory is /opt/docker in this example)
```
cd /opt/docker
docker run -ti  --privileged -p 80:80 -p 443:443 -v /opt/docker/clients:/clients yossibaruch/docker4hacker
```

## Keeping the container up to date
We can rebuild the image using the original build command, docker caches the image and it will continue the build from whatever step is prior to any changes.
You can keep the image up to date automatically using crontab:
0 6 * * * docker build -t yossibaruch/docker4hacker <PATH TO DOCKERFILE>

## Some notes
* By running docker run with the --privileged we grant this container elevated privileged or access to devices directly.
* Containers can also be used as sandboxes for testing applications. Spin up a default Debian container then install an application on it for testing without worrying about having to uninstall it afterwards.
