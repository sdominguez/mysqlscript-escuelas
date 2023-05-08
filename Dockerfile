# Base image
FROM mysql:8.0

# Add all scripts 
COPY ./scripts/ /docker-entrypoint-initdb.d/

EXPOSE 3306
