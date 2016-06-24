all: build

build:
	@docker build --rm --tag=recteurlp/mariadb .

release: build
	@docker build --rm --tag=recteurlp/mariadb:$(shell cat VERSION) .
