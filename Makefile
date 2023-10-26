all : build up

build : volumes
	docker compose -f srcs/docker-compose.yml build

up :
	docker compose -f srcs/docker-compose.yml up

down :
	docker compose -f srcs/docker-compose.yml down

volumes :
	mkdir -p ~/data/mariadb  ~/data/wordpress

clean_volumes: down
	docker volume rm mariadb wordpress
	sudo rm -rf ~/data/mariadb ~/data/wordpress

clean : down
	docker system prune -af

fclean : clean clean_volumes

re: fclean all

