FROM debian:stable-slim AS build

ENV RINETD_VERSION=v0.63

RUN apt-get update && \
    apt-get install -y wget gcc make && \
    wget https://github.com/samhocevar/rinetd/releases/download/${RINETD_VERSION}/rinetd-${RINETD_VERSION#v}.tar.gz && \
    tar zxvf rinetd-*.tar.gz && \
    mv rinetd-*/ rinetd && \
    cd rinetd/ && \
    ./configure && \
    make

FROM busybox:glibc

RUN mkdir /var/log /var/run && \
    ln -s /dev/stdout /var/log/rinetd.log
COPY --from=build /rinetd/rinetd /usr/sbin/rinetd
COPY entrypoint.sh /usr/local/bin/

EXPOSE 8000

ENTRYPOINT ["entrypoint.sh"]
