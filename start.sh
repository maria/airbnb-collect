#!/bin/bash
set -eo pipefail

exec psql --host db --username airbnb airbnb < airbnb-data-collection-0.1/postgresql/schema_current.sql "$@"
