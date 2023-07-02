#!/bin/bash
chmod 775 ./migration-konga.sh
docker run --rm -d \
--network=kong-net \
pantsel/konga:next -c prepare -a postgres -u postgresql://user:12345@kong-database:5432/konga_db