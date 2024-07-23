#!/bin/bash

# Запуск MySQL в фоновом режиме
service mysql start

# Подождите, пока MySQL полностью не запустится
until mysqladmin ping &>/dev/null; do
    echo -n "."; sleep 1
done

# Проверка и создание базы данных WordPress, если она не существует
if ! mysql -u root -prootpassword -e "USE wordpress"; then
    echo "Creating WordPress database..."
    mysql -u root -prootpassword -e "CREATE DATABASE wordpress;"
    mysql -u root -prootpassword -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password';"
    mysql -u root -prootpassword -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';"
    mysql -u root -prootpassword -e "FLUSH PRIVILEGES;"
fi

# Поддерживайте контейнер в активном состоянии
tail -f /dev/null
