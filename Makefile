.PHONY: sass githooks build up start stop down logs lint-saas lint-html

IMAGE_BASE = interrobangc
IMAGE = www
MY_PWD = $(shell pwd)

all: githooks build up logs

sass:
	docker run --rm -v $(MY_PWD)/html:/app/ --name interrobangc-www-sass interrobangc/sass sass --style expanded scss/interrobang.scss css/interrobang.css

githooks:
	./githooks/install-hooks

build:
	docker build -t $(IMAGE_BASE)/$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)

deploy-tag:
	tag="$(TAG)"; \
	if [ "$${tag-}" ]; then \
		echo "deploying tag: $$tag"; \
		git push --delete origin stage-$$tag; \
		git tag -d stage-$$tag; \
		git tag stage-$$tag; \
		git push origin stage-$$tag; \
	else \
		echo "you must provide a tag with TAG=some-tag-name"; \
		exit 1; \
	fi;

up:
	docker-compose -p $(IMAGE_BASE) up -d

start:
	docker-compose -p $(IMAGE_BASE) start

stop:
	docker-compose -p $(IMAGE_BASE) stop

down:
	docker-compose -p $(IMAGE_BASE) down

logs:
	docker-compose -p $(IMAGE_BASE) logs -f

shell:
	docker-compose -p $(IMAGE_BASE) exec www sh

lint-sass:
	docker run --rm -v $(MY_PWD):/app --name interrobangc-www-test-sass interrobangc/sass-lint

lint-html:
	docker run --rm -v $(MY_PWD):/app --name interrobangc-www-test-html interrobangc/htmllint htmllint html/index.html

lint: lint-sass lint-html