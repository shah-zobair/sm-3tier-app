#!/usr/bin/php
<?php
try{$dbuser = 'shah';
$dbpass = 'shah123';
$host = 'localhost';
#$host = '192.168.122.139';
$port = '5432';
$dbname = 'testing';
$sslcert = 'CERT/CLIENT/postgresql.crt';
$sslkey = 'CERT/CLIENT/postgresql.key';
$sslrootcert = 'CERT/root.crt';

#$conn = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
$conn = new PDO("pgsql:host=$host;dbname=$dbname;port=$port;sslmode=require;sslcert=$sslcert;sslkey=$sslkey;sslrootcert=$sslrootcert", $dbuser, $dbpass);

#$conn = new PDO('pgsql:host=localhost;port=5432;dbname=testing;sslmode=require;sslcert=CERT/CLIENT/postgresql.crt;sslkey=CERT/CLIENT/postgresql.key;sslrootcert=CERT/root.crt;',
#    'shah', 'shah123', array(
#      PDO::ATTR_ERRMODE          => PDO::ERRMODE_EXCEPTION,
#      PDO::ATTR_EMULATE_PREPARES => true,
#  ));

}
catch (PDOException $e)
{
echo "Error : " . $e->getMessage() . "<br/>";
die();
} 

$sql = 'SELECT * FROM dummy';

foreach ($conn->query($sql) as $row) {
        print $row['name'] . "\t";
        print $row['id'] . "\n";
    }

?>
