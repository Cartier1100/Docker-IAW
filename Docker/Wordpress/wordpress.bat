@echo off
REM Crear red para WordPress
docker network create wordpress-net

REM Crear contenedor de base de datos
docker run -d ^
  --name wordpress-db ^
  --network wordpress-net ^
  -e MYSQL_ROOT_PASSWORD=rootpassword ^
  -e MYSQL_DATABASE=wpdb ^
  -e MYSQL_USER=wpuser ^
  -e MYSQL_PASSWORD=wppassword ^
  -v %cd%\db-data:/var/lib/mysql ^
  mysql:5.7

REM Crear contenedor de WordPress
docker run -d ^
  --name wordpress ^
  --network wordpress-net ^
  -p 8086:80 ^
  -e WORDPRESS_DB_HOST=wordpress-db ^
  -e WORDPRESS_DB_USER=wpuser ^
  -e WORDPRESS_DB_PASSWORD=wppassword ^
  -e WORDPRESS_DB_NAME=wpdb ^
  -v %cd%\wp-data:/var/www/html ^
  wordpress
