echo "CREATE DATABASE testing;" | psql
echo "CREATE TABLE dummy (name varchar(50), id int);" | psql testing
echo "INSERT INTO dummy (name, id) values ('shah',1);" | psql testing
echo "SELECT * FROM dummy;" | psql testing

echo "CREATE ROLE shah with CREATEROLE login superuser PASSWORD 'shah123';" | psql
echo "GRANT ALL PRIVILEGES ON DATABASE testing to shah;" | psql

#echo "CREATE EXTENSION pgcrypto;" | psql testing
#echo "CREATE TABLE testuserscards(card_id SERIAL PRIMARY KEY, username varchar(100), cc bytea);" | psql testing
#echo "INSERT INTO testuserscards(username, cc)
#SELECT robotccs.username, pgp_pub_encrypt(robotccs.cc, keys.pubkey) As cc
#FROM (VALUES ('andrew', '41111111111111111'),
#    ('shah', '41111111111111112') ) As robotccs(username, cc)
#     CROSS JOIN (SELECT dearmor('`cat /tmp/public-pgp.key`') As pubkey) As keys;" | psql testing

#echo "SELECT * FROM testuserscards" | psql testing
