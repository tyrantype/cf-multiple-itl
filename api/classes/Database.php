<?php
class Database {
    private static function getConnection(): mysqli {
        return new mysqli("localhost", "root", "", "certainty_factor");
    }

    public static function query($sql):  stdClass {
        $response = new stdClass();
        $connection = Database::getConnection();
        $result = $connection->query($sql);
        
        if(isset($result->num_rows)) {
            if($result->num_rows > 0) {
                foreach($result as $row) $response->data[] = $row;
                if ($connection->insert_id !== null) {
                    $response->insertId = $connection->insert_id;
                }
            }
        }

        $connection->close();
        return $response;
    }
}

$su = Database::query("SELECT * FROM superuser");

$superuser = new stdClass();
$superuser->username = $su->data[0]["username"];
$superuser->password = $su->data[0]["password"];
$superuser->name = $su->data[0]["name"];
