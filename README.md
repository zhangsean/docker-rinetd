# rinetd
Dockerd rinetd from [leafsoar/rinetd](https://hub.docker.com/r/leafsoar/rinetd/).


## 使用方法
使用 docker 封装了 rinetd 功能，可以提供端口映射功能

一般内部默认为 8000 端口映射的配置

rinetd.conf

`
0.0.0.0 8000 [host] [port]
`

启动命令

`
docker run --name [proxy] -p [8080]:8000 -d leafsoar/rinetd [host] [port]
`


开启一个 web 服务

`
docker run --name web -p 8080:8080 -d leafsoar/helloworld
`


开启一个代理

`
docker run --name proxy -p 8000:8000 -d leafsoar/rinetd [IP] 8080
`


通过 link 代理

`
docker run --name proxy -p 8000:8000 --link web:web -d leafsoar/rinetd web 8080
`

## 其它用法
开启一个不暴露端口的容器

`
docker run --name web -d leafsoar/helloworld
`


通过 link 代理

`
docker run --name proxy -p 8000:8000 --link web:web -d leafsoar/rinetd web 8080
`


这对于使用 docker 而不用暴露不必要端口时，尤为有用，比如数据库

在比如有些环境 mysql 默认安装时，为提高安全性，只能通过本地 ip 访问，也可以用此方法
