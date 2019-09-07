FROM debian:stretch-slim

MAINTAINER peacheychen@gmail.com

RUN set -ex \
        && printf "deb http://deb.debian.org/debian sid main" > /etc/apt/sources.list.d/sid.list \
        && apt-get update \
        && apt-get -t sid install -y --no-install-recommends shadowsocks-libev simple-obfs \
        && rm -rf /var/lib/apt/lists/*

COPY shadowsocks.json /etc/shadowsocks-libev/config.json
WORKDIR /etc/shadowsocks-libev
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
USER nobody

ENTRYPOINT ["ss-server"]
CMD ["-c", "/etc/shadowsocks-libev/config.json" ]
