#!/bin/bash
set -e

echo "Waiting for MySQL to be ready at $OM_DATABASE_HOST:$OM_DATABASE_PORT ..."

while ! mysql -h "$OM_DATABASE_HOST" -P "$OM_DATABASE_PORT" \
    -u "$OM_DATABASE_USERNAME" -p"$OM_DATABASE_PASSWORD" -e "SELECT 1;" &> /dev/null
do
  echo "MySQL is unavailable - sleeping 2s"
  sleep 2
done

echo "MySQL is up - starting OpenMetadata"
exec /entrypoint.sh
