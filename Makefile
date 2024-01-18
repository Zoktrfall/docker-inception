all: up configure_volumes

up: configure_volumes
	@echo "Lifting containers..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@echo "!DONE!"

down:
	@echo "Dropping containers..."
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "!DONE!"

rm:
	@echo "Removing stopped service containers..."
	@docker-compose -f ./srcs/docker-compose.yml rm
	@echo "!DONE!"

clean:
	@echo "Cleaning docker containers..."
	@docker kill $(docker ps -q) 2> /dev/null || true
	@docker rm $(docker ps -aq) 2> /dev/null || true
	@echo "!DONE!"

fclean: clean
	@echo "Cleaning all docker images, networks, containers, volumes..."
	@docker system prune -af
	@echo "!DONE!"

configure_volumes:
	@mkdir -p ./wordpress
	@mkdir -p ./mariadb
	@mkdir -p ./portainer

remove_volumes:
	@rm -rf ./wordpress
	@rm -rf ./mariadb
	@rm -rf ./portainer

.PHONY	: all up down rm clean fclean configure_volumes remove_volumes