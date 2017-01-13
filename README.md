## Software
- wget, curl, nano editor
- git 1.9.1
- nginx 1.4.6
- php-fpm 7.0
- mysql 5.7.14-1
- nodejs 7.4.0
- npm 4.0.5
- mongoDB 3.4.1

## Run example (CMD)
docker run -tid --name="lemp" -v ~/xxx/sites:/etc/nginx/sites-enabled -v ~/xxx/html:/usr/share/nginx/html -v ~/xxx/mongodb:/var/lib/mongodb -p 80:80 -p 8000:8000 -p 50022:22 -p 27017:27017 wild0522/lemp /bin/bash

# enter container(deprecated)
> docker attach lemp

# dettach container(deprecated)
> keypress ctrl+p, ctrl+q 

# SSH
> ssh root@localhost -p 50022
(Password: root)

# cancel container
> docker stop lemp; docker rm lemp;

# MongoDB
- start
> mongod --config /etc/mongod.conf &

- status, terminal
> mongo localhost:27017

- stop
> mongod --config /etc/mongod.conf --shutdown

## Run example (docker-compose)
1. download zip ([click me!](https://github.com/wild0522/lemp/archive/master.zip))
1. upzip, enter the folder
1. docker-compose up -d

# enter container
> docker-compose exec lemp bash

# dettach container
> exit

# stop container
> docker-compose stop lemp

# stop and remove all container
> docker-compose down
