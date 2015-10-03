FROM fedora:22
MAINTAINER recteurlp recteurlp@gmail.com

COPY .docker/docker.cnf /etc/my.cnf.d/docker.cnf
COPY .docker/install /install

ENV TERM xterm

RUN dnf install -y pwgen logrotate hostname mariadb mariadb-server && dnf clean all && \
/bin/bash /install

COPY .docker/start /start

EXPOSE 3306

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql"]

CMD ["/start"]
