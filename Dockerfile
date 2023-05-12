# Base image
FROM mysql:8.0

# Add all scripts 
COPY ./scripts/ /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=1234

EXPOSE 3306

VOLUME /var/lib/mysql

#construye imagen
#> docker build -t mysqlesc:dev ./
#construye contenedor
#> docker run -d -p 3308:3306 --name mysql-escuelas -v /my/local/mysql/data:/var/lib/mysql mysqlesc:dev