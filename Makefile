all : build up

build:
	cd srcs && docker-compose -f build

up:
	cd srcs && docker-compose -f up -d

down:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans

stop:
	cd srcs && docker-compose -f stop

re: down build up

logs:
	docker-compose -f srcs/docker-compose.yml logs -f

clean:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans
	docker system prune -af

fclean:
	rm -rf /home/bhennequ/data
	mkdir -p /home/bhennequ/data && mkdir -p /home/bhennequ/data/wordpress && mkdir -p /home/bhennequ/data/wordpress
