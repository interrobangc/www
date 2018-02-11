.PHONY: build run

IMAGE_BASE = interrobangc/
IMAGE = www
MY_PWD = $(shell pwd)

all: build run

build:
	docker build -t $(IMAGE_BASE)$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)

run:
	docker run --rm -p 8889:80 -v $(MY_PWD)/html:/var/www/interrobang.consulting/html $(IMAGE_BASE)$(IMAGE)
