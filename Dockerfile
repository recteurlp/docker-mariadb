FROM fedora:22
MAINTAINER recteurlp recteurlp@gmail.com

ADD .docker/my.cnf /etc/my.cnf
ADD .docker/start /start
ADD .docker/setup/install /mysql/setup/install

RUN dnf install -y logrotate hostname mariadb mariadb-server && dnf clean all && \
/bin/bash /mysql/setup/install

ENV TERM xterm

EXPOSE 3306

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql"]

CMD ["/start"]
