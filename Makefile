all: build

build:
	@docker build --rm --tag=recteurlp/mariadb .
