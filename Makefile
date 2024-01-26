all: voldir
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build: voldir
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up --build -d

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

nod: voldir
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up

nod_build: voldir
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env --build up

voldir:
	@mkdir -p ../data/mysql
	@mkdir -p ../data/wordpress

re: down build

clean: down
	-@docker stop $(docker ps -qa) 2>/dev/null; true;
	-@docker rm $(docker ps -qa) 2>/dev/null; true;
	-@docker rmi -f $(docker images -qa) 2>/dev/null; true;
	-@docker volume rm $(docker volume ls -q) 2>/dev/null; true;
	-@docker network rm $(docker network ls -q) 2>/dev/null; true;
	@echo "stopped all containers & clean up images"
	
fclean: down clean
	-@sudo rm -rf ../data/mysql && mkdir -p ../data/mysql; true;
	-@sudo rm -rf ../data/wordpress && mkdir -p ../data/wordpress; true;
	@echo "cleaned mysql and wordpress volumes"

sysclean: clean
	-@docker system prune -a --volumes --force
	@echo "completely cleaned up docker"

.PHONY	: all build down re clean fclean
