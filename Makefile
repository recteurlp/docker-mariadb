all: build

build:
	@docker build --rm --tag=pyrmin.io:5000/mariadb .

release: build
	@docker build --rm --tag=pyrmin.io:5000/mariadb:$(shell cat VERSION) .
