include srcs/.env

all : up

up:
	mkdir -p $(VOLUMES_ROOTS)/mariadb $(VOLUME_ROOTS)/wordpress
	docker build ./srcs/requirements/nginx -t nginx
	docker build ./srcs/requirements/mariadb -t mariadb
	docker build ./srcs/requirements/wordpress -t wordpress
	cd srcs && docker-compose -up

down:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans

re: down un

logs:
	docker-compose -f srcs/docker-compose.yml logs -f

clean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	rm -rf $(VOLUME_TOO)/mariadb $(VOLUMES_ROOT)/wordpress 

fclean:
	rm -rf $(VOLUMES_ROOT)
