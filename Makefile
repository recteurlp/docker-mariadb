all: build

build:
	@docker build --rm --tag=pyrmin.io:5000/recteurlp/mariadb .

release: build
	@docker build --rm --tag=pyrmin.io:5000/recteurlp/mariadb:$(shell cat VERSION) .
