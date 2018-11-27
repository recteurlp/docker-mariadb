FROM fedora:29
MAINTAINER recteurlp recteurlp@gmail.com

COPY .docker/docker.cnf /docker.cnf
COPY .docker/entrypoint.sh /entrypoint.sh

ENV TERM xterm

RUN dnf -v -y --refresh install \
 pwgen \
 logrotate \
 hostname \
 mariadb \
 mariadb-server \
 && dnf clean all \
 && rm -rf /usr/share/doc /usr/share/man /tmp/* \
    /etc/my.cnf.d/auth_gssapi.cnf \
 && sed -i 's:pid-file=/var/run/mariadb/mariadb.pid:pid-file=/run/mysqld/mariadb.pid:' /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql"]

CMD ["/entrypoint.sh"]
