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
 volumes:
 - /opt/mariadb:/var/lib/mysql
EOF

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
git clone https://github.com/recteurlp/docker-mariadb
cd docker-mariadb
make
```