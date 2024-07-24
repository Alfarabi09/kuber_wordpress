#Собираем контейнеры в миникубе
```commandline
eval $(minikube docker-env)
```

#Даем названия контейнерам my-mysql и my-web-app
```commandline
docker build -t my-mysql sql/
docker build -t my-web-app .
```
```commandline
kubectl apply -f mysql-pv.yaml
kubectl apply -f mysql-pvc.yaml
kubectl apply -f mysql-statefulset.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f web-pv.yaml
kubectl apply -f web-pvc.yaml
kubectl apply -f web-deployment.yaml
kubectl apply -f web-service.yaml
kubectl apply -f ingress.yaml
```



#Нужно вручную зайти в контейнер или через скрипт start.sh установить wordpress
```commandline
wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
tar -xzf /tmp/wordpress.tar.gz -C /var/www/html/ --strip-components=1
rm /tmp/wordpress.tar.gz
```

#Настроить wp-config.php

#Вручную в контейнере my-mysql создать бд
```commandline
mysql -u root -p

CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';
FLUSH PRIVILEGES;

```
