#!/bin/bash
chmod 775 ./migration-bootstrap.sh
docker run --rm -d \
--network=kong-net \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-database" \
-e "KONG_PG_DATABASE=kong_db" \
-e "KONG_PG_USER=user" \
-e "KONG_PG_PASSWORD=12345" \
-e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
kong:1.3.0-alpine kong migrations bootstrap