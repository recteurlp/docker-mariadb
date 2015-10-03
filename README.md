recteurlp/mariadb
=================

Fedora 22 dockerfile for MariaDB

**The container set a root password on each start**

# QuickStart

## Ephemeral

```bash
docker run -d \
 -e MYSQL_DATABASE=db \
 -e MYSQL_USER=user \
 -e MYSQL_PASSWORD=password \
 -t recteurlp/mariadb
```

if MYSQL_ROOT_PASSWORD is not set the container auto-generate and print a root password into the startup log

## Extended Docker Compose

```bash
cat >> docker-compose.yml <<EOF
MariaDB:
 image: recteurlp/mariadb
 ports:
  - "3306:3306"
 environment:
  MYSQL_ROOT_PASSWORD: changeme
  MYSQL_DATABASE: db
  MYSQL_USER: user
  MYSQL_PASSWORD: password
 volumes:
  - /var/lib/mysql
  - /etc/my.cnf.d
EOF
```

## SELinux

```bash
chcon -Rt svirt_sandbox_file_t /var/lib/mysql
```

## Client

```bash
docker run -i --rm --volumes-from=mariadb -t recteurlp/mariadb mysql -u root -p
```

# Build

### Fresh Build

```bash
docker build --rm -t recteurlp/mariadb https://github.com/recteurlp/docker-mariadb.git
```

### To Edit

```bash
git clone https://github.com/recteurlp/docker-mariadb.git
cd docker-mariadb
make
```
