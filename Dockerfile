FROM fedora:23
MAINTAINER recteurlp recteurlp@gmail.com

COPY .docker/docker.cnf /docker.cnf

ENV TERM xterm

RUN dnf install -y pwgen logrotate hostname mariadb mariadb-server && dnf clean all

COPY .docker/start /start

EXPOSE 3306

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql"]

CMD ["/start"]
