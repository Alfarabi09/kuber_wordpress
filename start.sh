#!/bin/bash

# Удаление стартовой страницы Apache, если она существует
#rm -f /var/www/html/index.html

# Запуск службы MySQL
#service mysql start

# Проверка существования базы данных и создание, если отсутствует
#if ! mysql -e "USE wordpress"; then
#    echo "Creating WordPress database..."
#    mysql -e "CREATE DATABASE wordpress;"
#    mysql -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password';"
#    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';"
#    mysql -e "FLUSH PRIVILEGES;"
#fi

# Проверка наличия wp-config.php и установка WordPress, если отсутствует
##if [ ! -f /var/www/html/wp-config.php ]; then
#    echo "Installing WordPress..."
#    wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
#    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html/ --strip-components=1
#    rm /tmp/wordpress.tar.gz
#
#    cp /var/www/html/wp-config.php /var/www/html/wp-config.php
#    sed -i "s/database_name_here/$DB_NAME/" /var/www/html/wp-config.php
#    sed -i "s/username_here/$DB_USER/" /var/www/html/wp-config.php
#    sed -i "s/password_here/$DB_PASSWORD/" /var/www/html/wp-config.php
#fi

# Назначение прав владельца
chown -R www-data:www-data /var/www/html

# Запуск Apache
apache2ctl -D FOREGROUND
