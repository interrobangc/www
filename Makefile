.PHONY: build run

IMAGE_BASE = interrobangc
IMAGE = www
MY_PWD = $(shell pwd)

all: build run

build:
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)

run:
	docker run --rm -p 80:80 -p 443:443 -v $(MY_PWD):/var/www/interrobang.consulting --name $(IMAGE_BASE)-$(IMAGE) $(IMAGE_BASE)/$(IMAGE)
