#!/bin/bash
set -eo pipefail

exec psql --host db --username postgres <<-EOSQL
    CREATE USER airbnb;
    CREATE DATABASE airbnb;
    GRANT ALL PRIVILEGES ON DATABASE airbnb TO airbnb;
EOSQL
exec psql --host db --username airbnb airbnb < postgresql/schema_current.sql
exec while true; do echo 'up and running'; done;
exec "$@"
