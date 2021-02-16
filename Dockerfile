FROM debian:8-slim AS build

ENV RINETD_VERSION=0.72

RUN apt-get update && \
    apt-get install -y wget gcc make && \
    wget https://github.com/samhocevar/rinetd/releases/download/v${RINETD_VERSION}/rinetd-${RINETD_VERSION}.tar.gz && \
    tar zxvf rinetd-${RINETD_VERSION}.tar.gz && \
    mv rinetd-${RINETD_VERSION} rinetd && \
    cd rinetd/ && \
    ./configure && \
    make

FROM busybox:glibc

RUN mkdir /var/log && \
    ln -s /dev/stdout /var/log/rinetd.log
COPY --from=build /rinetd/rinetd /usr/sbin/rinetd
COPY entrypoint.sh /usr/local/bin/

EXPOSE 8000

ENTRYPOINT ["entrypoint.sh"]
