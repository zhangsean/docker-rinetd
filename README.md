# rinetd
Dockerized rinetd, simply TCP port forward to any port which the container reachable.

Specially useful for running containers which didn't expose some port when it starting for security reason.

Specially useful for exposing a TCP port proxy to an internal service on a gateway server.

Forked from [leafsoar/rinetd](https://hub.docker.com/r/leafsoar/rinetd/).

[![DockerHub Badge](http://dockeri.co/image/zhangsean/rinetd)](https://hub.docker.com/r/zhangsean/rinetd/)


## Usage

Simple run:
```shell
docker run -d --name [proxy] -p [new-port]:8000 zhangsean/rinetd [host] [port]
```

Web example:
```shell
# run a web server
docker run --name web -p 8080:8080 -d zhangsean/hello-web

# Run a port proxy with link:
docker run --name web-proxy -p 8000:8000 --link web:web -d zhangsean/rinetd web 8080

# Run a port proxy without link:
docker run --name web-proxy -p 8000:8000 -d zhangsean/rinetd [IP] 8080
```

MySQL example:
```shell
# run a mysql server
docker run --name mysql -d mysql

# Run a port proxy with link:
docker run --name mysql-proxy -p 3306:8000 --link mysql:mysql -d zhangsean/rinetd mysql 3306
```
