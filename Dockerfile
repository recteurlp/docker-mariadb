FROM fedora:24
MAINTAINER recteurlp recteurlp@gmail.com

COPY .docker/docker.cnf /docker.cnf

ENV TERM xterm

RUN dnf -v -y --refresh install \
 pwgen \
 logrotate \
 hostname \
 mariadb \
 mariadb-server \
 && dnf clean all && rm -rf /usr/share/doc /usr/share/man /tmp/*

COPY .docker/entrypoint.sh /entrypoint.sh

EXPOSE 3306

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql"]

CMD ["/entrypoint.sh"]
