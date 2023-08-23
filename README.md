# myip
A light-weight HTTP server that tells you what your public IPv4 is.

### Let's build your own
```sh
$ docker build . -t myip
```
### or use my pre-built image
on [Docker hub](https://hub.docker.com/repository/docker/tuanm/myip-server),
### and start it up
```sh
$ docker run -p 8080:8080 -d myip
```
