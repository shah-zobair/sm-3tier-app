#!/usr/bin/php
<?php
try{$dbuser = 'shah';
$dbpass = 'shah123';
$host = 'localhost';
$dbname='testing';
$conn = new PDO("pgsql:host=$host;dbname=$dbname", $dbuser, $dbpass);
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
