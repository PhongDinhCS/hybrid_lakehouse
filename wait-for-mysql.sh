#!/bin/sh
# wait-for-mysql.sh

set -e

host="$1"
shift
cmd="$@"

until mysql -h "$host" -P 3306 -u "$OM_DATABASE_USERNAME" -p"$OM_DATABASE_PASSWORD" -e "SELECT 1;" > /dev/null 2>&1; do
  echo "MySQL is unavailable - sleeping 2s"
  sleep 2
done

echo "MySQL is up - executing command"
exec $cmd
