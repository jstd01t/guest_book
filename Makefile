SHELL := /bin/bash

server:
	symfony server:stop
	symfony server:start -d
	symfony run -d --watch=config,src,templates,vendor symfony console messenger:consume async -vv
	mailcatcher

tests:
	symfony console doctrine:database:drop --force --env=test || true
	symfony console doctrine:database:create --env=test
	symfony console doctrine:migrations:migrate -n --env=test
	symfony console doctrine:fixtures:load -n --env=test
	symfony php bin/phpunit $@
.PHONY: server, tests