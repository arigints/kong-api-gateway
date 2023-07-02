#!/bin/bash
docker network create kong-net
chmod 775 ./postgress-run-container.sh
docker run --name kong-database -d \
--network=kong-net \
-v "${PWD}/postgres/data:/var/lib/postgresql/data" \
-e "POSTGRES_USER=user" \
-e "POSTGRES_PASSWORD=12345" \
-e "POSTGRES_DB=kong_db" \
-p 5432:5432 \
postgres:9.6