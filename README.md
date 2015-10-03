recteurlp/mariadb
=================

Fedora 22 dockerfile for MariaDB

Tested on Docker 1.8.1

## To run with docker-compose :

```bash
cat >> docker-compose.yml <<EOF
MariaDB:
 image: recteurlp/mariadb
 container_name: mariadb
 ports:
 - "3306:3306"
EOF
```

### Persistant Data and Extra Config Files

```bash
cat >> docker-compose.yml <<EOF
 volumes:
 - /var/lib/mysql:/var/lib/mysql
 - /etc/my.cnf.d/:/etc/my.cnf.d/
EOF
```

### SELinux

```bash
chcon -Rt svirt_sandbox_file_t /var/lib/mysql
```

### Start

```bash
docker-compose up -d
```

Then you can test it :

```bash
 docker run -i --rm --volumes-from=mariadb -t recteurlp/mariadb mysql -u root -pchangeme
```

or if you have a MySQL Client

```bash
mysql -u root -pchangeme
```

## To build:

Over the net via git -

```bash
docker build --rm -t recteurlp/mariadb https://github.com/recteurlp/docker-mariadb.git
```

or

Copy the sources down -

```bash
git clone https://github.com/recteurlp/docker-mariadb.git
cd docker-mariadb
make
```