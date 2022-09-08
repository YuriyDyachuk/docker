# This is an easily customizable makefile template. The purpose is to
# provide an instant building environment for docker.

##==========================================================================
## Docker commands
##==========================================================================

# $ make help                - help docker container
# $ make info                - info docker container
# $ make build               - build docker build
# $ make start               - start docker containers
# $ make restart             - restart docker containers
# $ make stop                - stop docker containers
# $ make login               - log in php-fpm APP container
# $ make remove              - removing all containers
# $ make composer-install    - run composer install
# $ make artisan-command     - run artisan command ALL
# $ make ps                  - ALL container info [docker ps -a]

##==========================================================================
## Variables
##==========================================================================
include .env
export

##==========================================================================
DOCKER_EXEC_PHP_FPM = docker exec -it --user=www-data ${CONTAINER_PHP_FPM_NAME}

##====================================docker-compose======================================
DOCKER_COMPOSE_FILENAME = docker-compose.yaml

##==========================================================================
## make help
##==========================================================================
help:   ## For supporting information
	@echo "\n$(GREEN)Available commands$(RESET)"
	@echo "---------------------------------------------------------------------"
	@grep -h -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "---------------------------------------------------------------------"
	@echo "$(YELLOW)Example argument to install Packer:$(RESET) make install packer=true"
	@echo "$(YELLOW)Example for auto-approve:$(RESET) make globalvars-apply auto=yes"
	@echo "$(YELLOW)Debug mode show command not run:$(RESET) make vpc-apply debug=yes"
	@echo "$(YELLOW)Output json format:$(RESET) make output c=vpc-aws f=json \n"

##==========================================================================
## make info
##==========================================================================
info:   ## For developer information
	@echo "Show..."
	@echo "$(GREEN)Project Name:$(RESET) ${PROJECT_NAME}"
	@#echo "---------------------------------------------------------------------"
	@echo "$(YELLOW)os:$(RESET) ${os} $(YELLOW)arch:$(RESET) ${arch}"
	@echo "$(YELLOW)UNAME:$(RESET) ${UNAME} $(YELLOW)BUILD_DATE:$(RESET) ${BUILD_DATE}"
	@echo "$(YELLOW)CURRENT_DIR:$(RESET) ${CURRENT_DIR}"
	@test -z "${ADMIN_USERNAME}" || echo "$(GREEN)Admin Username:$(RESET) ${ADMIN_USERNAME}"
	@test -z "${ADMIN_PASSWORD}" || echo "$(GREEN)Admin Password:$(RESET) ${ADMIN_PASSWORD}"
	@echo "---------------------------------------------------------------------"

##==========================================================================
## make build
##==========================================================================
build:   ## Run build docker container NEW
	@echo "Start Build project..."
	docker network create ${APP_NETWORK_NAME} || true && \
	docker-compose -f $(DOCKER_COMPOSE_FILENAME) build  --no-cache

##==========================================================================
## make start
##==========================================================================
start:   ## Run docker start container
	@echo "Start docker-compose..."
	docker-compose -f $(DOCKER_COMPOSE_FILENAME) up --build -d

##==========================================================================
## make restart
##==========================================================================
restart:   ## Restart Docker container
	@echo "Restart..."
	@sudo systemctl restart docker-compose@gw.service
	docker-compose down
	docker-compose up --build -d

##==========================================================================
## make stop
##==========================================================================
stop:   ## Run docker stop container
	@echo "Stop docker-compose..."
	docker-compose -f ${DOCKER_COMPOSE_FILENAME} down

##==========================================================================
## make login
##==========================================================================
login:   ## Run docker exec for container php-fpm
	@echo "Login in docker container..."
	$(DOCKER_EXEC_PHP_FPM) bash

##==========================================================================
## make remove containers
##==========================================================================
remove:   ## Run deleting containers
	@echo "Deleting docker-compose..."
	docker-compose down --remove-orphans

##==========================================================================
## make composer-install
##==========================================================================
composer-install:	## Run composer install
	@echo "Composer install..."
	$(DOCKER_EXEC_PHP_FPM) bash /var/www/app/scripts/init.sh

##==========================================================================
## make artisan-command
## make artisan-command CMD=config:cache
##==========================================================================
artisan-command:   ## Run artisan command ALL
    ifneq ($(CMD),)
	    $(DOCKER_EXEC_PHP_FPM) sh -c "php artisan $(CMD)"
    else
	    $(DOCKER_EXEC_PHP_FPM) sh -c "php artisan"
    endif

##==========================================================================
## make ps
##==========================================================================
ps:   ## List containers
ifdef WERF_ENABLED
	@echo "werf not support ps"
else
	@docker-compose ps
endif