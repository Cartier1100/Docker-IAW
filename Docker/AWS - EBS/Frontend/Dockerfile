FROM ubuntu:20.04

# Update repositories index
RUN apt update --fix-missing && apt upgrade -y

# Install util tools
RUN ln -snf /usr/share/zoneinfo/UTC /etc/localtime && echo "UTC" > /etc/timezone
RUN apt install -y apt-utils git rsync nano vim unzip curl wget software-properties-common mysql-client

# Install Apache
RUN apt-get install -y apache2

# Config Apache
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_LOG_DIR=/var/log/apache2
RUN chown www-data:www-data -R /var/www
RUN chmod -R 755 /var/www

RUN a2enmod rewrite headers
RUN service apache2 start
WORKDIR /var/www/html
COPY Code/. /var/www/html

EXPOSE 80

# Ejecutar Apache2 en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]