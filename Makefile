all : build up

build : volumes
	docker compose -f srcs/docker-compose.yml build

up :
	docker compose -f srcs/docker-compose.yml up -d

down :
	docker compose -f srcs/docker-compose.yml down

volumes :
	mkdir -p ~/data/mariadb  ~/data/wordpress ~/data/pelican

clean_volumes: down
	docker volume rm mariadb wordpress pelican
	sudo rm -rf ~/data/mariadb ~/data/wordpress ~/data/pelican

clean : down
	docker system prune -af

fclean : clean clean_volumes

re: fclean all

