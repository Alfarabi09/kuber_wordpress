#!/bin/bash

# Запуск MySQL сервера
service mysql start

# Ожидание завершения процесса запуска
sleep 5

# Создание пользователя и предоставление привилегий
mysql -u root -prootpassword <<EOF
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'fara';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;
EOF

# Ожидание завершения процесса запуска
tail -f /var/log/mysql/error.log
