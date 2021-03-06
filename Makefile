all: build

build:
	@docker build --pull --no-cache --rm --tag=pyrmin.io/mariadb .

build-proxy:
	@docker build --pull --no-cache --rm --build-arg HTTP_PROXY="http://172.17.0.1:3128" --build-arg HTTPS_PROXY="http://172.17.0.1:3128" --tag=pyrmin.io/mariadb .

release: build
	@docker build --rm --tag=pyrmin.io/mariadb:$(shell cat VERSION) .

goss: build
	@dgoss run pyrmin.io/mariadb