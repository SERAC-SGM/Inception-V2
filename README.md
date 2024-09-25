# INCEPTION
Small infrastructure composed of different services:
- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains the WordPress database.
- A second volume that contains the WordPress website files.
- A docker-network that establishes the connection between the containers.
- A Docker container tgat contains Redis cache for the WordPress website .
- A Docker conatiner that contains a FTP server pointing to the volume of the WordPress website.
- A Docker container that contains a simple static website created using Pelikan.
- A Docker container that contains Adminer.

## Usage
- Add a .env file ([template](https://github.com/SERAC-SGM/Inception-V2/blob/master/.env_template)) to the SRCS directory.

      make all
