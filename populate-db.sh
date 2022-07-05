#!/bin/bash

echo "CREATE TABLE dummy (name varchar(50), id int);" | PGPASSWORD=pass psql db -h backend-postgres -U user
echo "INSERT INTO dummy (name, id) values ('shah',1);" | PGPASSWORD=pass psql db -h backend-postgres -U user
echo "INSERT INTO dummy (name, id) values ('mike',2);" | PGPASSWORD=pass psql db -h backend-postgres -U user
echo "INSERT INTO dummy (name, id) values ('alex',3); INSERT INTO dummy (name, id) values ('sean',4);" | PGPASSWORD=pass psql db -h backend-postgres -U user
echo "SELECT * FROM dummy;" | PGPASSWORD=pass psql db -h backend-postgres -U user
