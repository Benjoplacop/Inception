include srcs/.env

all : up

up:
	mkdir -p $(VOLUMES_ROOTS)/mariadb $(VOLUME_ROOTS)/wordpress
	cd srcs && docker-compose build && docker-compose up -d

down:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans

re: down up

logs:
	docker-compose -f srcs/docker-compose.yml logs -f

clean:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans
	docker system prune -af
	rm -rf $(VOLUME_TOO)/mariadb $(VOLUMES_ROOT)/wordpress 

fclean:
	rm -rf $(VOLUMES_ROOT)
