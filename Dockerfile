FROM centos:7

MAINTAINER peacheychen@gmail.com

RUN yum -y update && \
    yum -y install epel-release python-setuptools m2crypto && \
    yum clean all

RUN easy_install pip
RUN pip install shadowsocks

WORKDIR /

COPY shadowsocks.json /etc/shadowsocks.json


CMD ["ssserver"]

ENTRYPOINT ["-c","/etc/shadowsocks.json"]
