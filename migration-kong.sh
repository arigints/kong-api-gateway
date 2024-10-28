#!/bin/bash
chmod 775 ./migration-kong.sh
docker run -d \
--network=kong-net \
pantsel/konga:next -c prepare -a postgres -u postgresql://user:12345@kong-database:5432/konga_db