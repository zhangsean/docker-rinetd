# Docker-Rinetd

[![DockerHub Badge](http://dockeri.co/image/zhangsean/rinetd)](https://hub.docker.com/r/zhangsean/rinetd/)

Dockerized rinetd, simply TCP port forward to any port which the container reachable.

Specially useful for running containers which didn't expose some port when it starting for security reason.

Specially useful for exposing a TCP port proxy to an internal service on a gateway server.

Forked from [leafsoar/rinetd](https://hub.docker.com/r/leafsoar/rinetd/).

## Usage

### TLTR

```sh
docker run -d -p [local-port]:8000 zhangsean/rinetd [remote ip/name] [remote port]
```

### SSH forward

```sh
# Forward local port 2222 to remote host ssh on 192.168.1.100:22
docker run -itd --name ssh-forward -p 2222:8000 zhangsean/rinetd 192.168.1.100 22
```

### Web container forward

```sh
# Run a web server
docker run --name web -p 8080:8080 -d zhangsean/hello-web

# Run a port proxy with link:
docker run --name web-proxy -p 8000:8000 --link web:web -d zhangsean/rinetd web 8080

# Run a port proxy without link:
docker run --name web-proxy -p 8000:8000 -d zhangsean/rinetd [IP] 8080
```

### MySQL container forward

```sh
# run a mysql server
docker run --name mysql -d mysql

# Run a port proxy with link:
docker run --name mysql-proxy -p 3306:8000 --link mysql:mysql -d zhangsean/rinetd mysql 3306
```

### Given bind port

```sh
# Forward host:8086 to container proxy:80, container bind :80 to 172.16.2.3:8010
docker run -itd --name proxy -p 8086:80 zhangsean/rinetd 172.16.2.3 8010 80
```

### UDP

```sh
docker run -itd --name ntp -p 123:123/udp zhangsean/rinetd ntp.aliyun.com 123 123 udp
```
