## Description

This repository contains the HTML, CSS, and Docker configuration for the site <https://interrobang.consulting>.

## Requirements

* [Make](https://www.gnu.org/software/make/)
* [Docker Engine](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

Run `make` to create a local development.

Once the dev environment is running, you will be able to access the page at <https://localhost> for testing.

A container running [sass](https://github.com/sass/sass) in watch mode runs alongside the primary nginx container. All scss files in `./html/scss` will be converted to css in `./html/css` as you modify them.

## Testing

Run `make lint` to perform on demand linting. The `make` command will configure a pre-commit hook in your local repository that will block commits that do not pass the lint tests.

## Make Commands

* `make sass` - Manually run sass conversion.
* `make githooks` - Install githooks.
* `make build` - Builds docker image.
* `make up` - Spins up the development environment.
* `make start` - Starts a stopped development environment.
* `make stop` - Stops a running development environment.
* `make down` - Destroys a running development environment.
* `make logs` - Streams logs from a running development environment.
* `make shell` - Gets a shell on the development environment www container.
* `make lint-sass` - Runs [sass-lint](https://github.com/sasstools/sass-lint) against the development environment.
* `make lint-html` - Runs [htmllint](https://github.com/htmllint/htmllint) against the development environment.
* `make lint` - Runs all linting against the development environment.
