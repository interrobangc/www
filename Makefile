.PHONY: sass build run

IMAGE_BASE = interrobangc
IMAGE = www
MY_PWD = $(shell pwd)

all: build up

sass:
	docker run --rm -v $(MY_PWD)/html:/app/ --name interrobangc-www-sass interrobangc/sass sass --style expanded scss/interrobang.scss css/interrobang.css

build:
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)

up:
	docker-compose up -d

start:
	docker-compose start

stop:
	docker-compose stop

down:
	docker-compose down

logs:
	docker-compose logs -f
