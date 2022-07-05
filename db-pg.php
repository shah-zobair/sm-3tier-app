<?php
try{$dbuser = 'user';
$dbpass = 'pass';
$host = 'backend-postgres';
$port = '5432';
$dbname = 'db';

$conn = new PDO("pgsql:host=$host;dbname=$dbname;port=$port", $dbuser, $dbpass);

}
catch (PDOException $e)
{
echo "Error : " . $e->getMessage() . "<br/>";
die();
} 

$sql = 'SELECT * FROM dummy';

foreach ($conn->query($sql) as $row) {
        print $row['name'] . "\t";
        print $row['id'] . "<br>";
    }

?>
