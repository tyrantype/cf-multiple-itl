<?php
    session_start();
    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        require_once "classes/Users.php";

        $data = json_decode(file_get_contents("php://input"));

        $response = Users::login($data->username, $data->password);
        if ($response->statusCode === 200) {
            $_SESSION["username"] = $data->username;
            echo '{"loginStatus": "success"}';
        } else {
            echo '{"loginStatus": "failed"}';
        }
        die();
    }
    
?>