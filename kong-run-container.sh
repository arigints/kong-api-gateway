#!/bin/bash
chmod 775 ./kong-run-container.sh
docker run --name kong -d \
--network=kong-net \
-e "KONG_LOG_LEVEL=debug" \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-database" \
-e "KONG_PG_DATABASE=kong_db" \
-e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
-e "KONG_PG_USER=user" \
-e "KONG_PG_PASSWORD=12345" \
-e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
-e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
-e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
-e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
-e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
-e "KONG_PROXY_LISTEN=0.0.0.0:8000" \
-e "KONG_PROXY_LISTEN_SSL=0.0.0.0:8443" \
-p 8000:8000 \
-p 8443:8443 \
-p 8001:8001 \
-p 8444:8444 \
kong:1.3.0-alpine