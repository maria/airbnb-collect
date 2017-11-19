#!/bin/bash
set -eo pipefail

exec psql --host db --username postgres <<-EOSQL
    CREATE USER airbnb;
    CREATE DATABASE airbnb;
    GRANT ALL PRIVILEGES ON DATABASE airbnb TO airbnb;
EOSQL
exec psql --host db --username airbnb airbnb < airbnb-data-collection-0.1/postgresql/schema_current.sql "$@"
