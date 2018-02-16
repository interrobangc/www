.PHONY: sass githooks build up start stop down logs lint-saas lint-html

IMAGE_BASE = interrobangc
IMAGE = www
MY_PWD = $(shell pwd)

all: githooks build up

sass:
	docker run --rm -v $(MY_PWD)/html:/app/ --name interrobangc-www-sass interrobangc/sass sass --style expanded scss/interrobang.scss css/interrobang.css

githooks:
	./githooks/install-hooks

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

shell:
	docker-compose exec www sh

lint-sass:
	docker run --rm -v $(MY_PWD):/app --name interrobangc-www-test-sass interrobangc/sass-lint

lint-html:
	docker run --rm -v $(MY_PWD):/app --name interrobangc-www-test-html interrobangc/htmllint htmllint html/index.html

lint: lint-sass lint-html