@echo off
REM Crear red para MediaWiki
docker network create mediawiki-net

REM Crear contenedor de base de datos
docker run -d ^
  --name mediawiki-db ^
  --network mediawiki-net ^
  -e MYSQL_ROOT_PASSWORD=rootpassword ^
  -e MYSQL_DATABASE=wikidb ^
  -e MYSQL_USER=wikiuser ^
  -e MYSQL_PASSWORD=wikipassword ^
  -v %cd%\db-data:/var/lib/mysql ^
  mysql:5.7

REM Crear contenedor de MediaWiki
docker run -d ^
  --name mediawiki ^
  --network mediawiki-net ^
  -p 8085:80 ^
  -e MEDIAWIKI_DB_HOST=mediawiki-db ^
  -e MEDIAWIKI_DB_USER=wikiuser ^
  -e MEDIAWIKI_DB_PASSWORD=wikipassword ^
  -e MEDIAWIKI_DB_NAME=wikidb ^
  -v %cd%\wiki-data:/var/www/html ^
  mediawiki
