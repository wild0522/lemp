FROM ubuntu:14.04
MAINTAINER wild0522 <wild0522@gmail.com>

USER root

RUN locale-gen en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8;
ENV LC_ALL=en_US.UTF-8;
ENV LC_CTYPE=UTF-8;
ENV LANG=en_US.UTF-8;
ENV TERM xterm

#ADD nginx.conf /etc/nginx/
#COPY sites/*.conf /etc/nginx/sites-enabled/

RUN apt-get update

RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

#install wget, nano editor, nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes wget && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes nano && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes nginx

#install php7
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common && \
LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:ondrej/php && \
DEBIAN_FRONTEND=noninteractive apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes php7.0 php7.0-fpm php7.0-mysql php7.0-curl php7.0-gd php7.0-json php7.0-mcrypt php7.0-opcache php7.0-xml php7.0-mbstring;

#install mysql 5.7
RUN \
LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:ondrej/mysql-5.7 && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes mysql-server;

#mount folder: nginx config, nginx html, www, log
VOLUME ["/etc/nginx/sites-enabled","/usr/share/nginx/html","/var/www"]

#auto start nginx, php7
ENTRYPOINT \
service nginx start && \
service php7.0-fpm start && \
service mysql restart && \
/bin/bash

EXPOSE 80
