<?php
    session_start();

    require_once "classes/Users.php";
    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {

        $data = json_decode(file_get_contents("php://input"));

        if ($data->username === $superuser->username) {
            if (password_verify($data->password, $superuser->password)) {
                $_SESSION["username"] = $superuser->username;
                echo '{"loginStatus": "success"}';
            } else {
                echo '{"loginStatus": "failed"}';
            }
        } else {
            $response = Users::login($data->username, $data->password);
            if ($response->statusCode === 200) {
                $_SESSION["username"] = $data->username;
                Users::updateLastLogin($data->username);
                echo '{"loginStatus": "success"}';
            } else {
                echo '{"loginStatus": "failed"}';
            }
        }
    }
    
?>