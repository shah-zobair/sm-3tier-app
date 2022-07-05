#!/bin/bash

/usr/bin/pg_ctl -D /var/lib/pgsql -l /tmp/logfile -w start

echo "CREATE DATABASE testing;" | psql
echo "CREATE TABLE dummy (name varchar(50), id int);" | psql testing
echo "INSERT INTO dummy (name, id) values ('shah',1);" | psql testing
echo "SELECT * FROM dummy;" | psql testing

echo "CREATE ROLE shah with CREATEROLE login superuser PASSWORD 'shah123';" | psql testing
echo "GRANT ALL PRIVILEGES ON DATABASE testing to shah;" | psql testing

#INSERT SOME ENCRYPTED TEST DATA
/db_entry.sh

/usr/bin/pg_ctl -D /var/lib/pgsql/data -w stop
