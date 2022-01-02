<?php
    session_start();

    require_once "classes/Users.php";
    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {

        $data = json_decode(file_get_contents("php://input"));

        if ($data->username === $superuser->username) {
            if (password_verify($data->password, $superuser->password)) {
                $_SESSION["username"] = $superuser->username;
                echo <<<HEREDOC
                    {"loginStatus": "success", "message": "Berhasil masuk"}
                HEREDOC;
            } else {
                echo <<<HEREDOC
                    {"loginStatus": "failed", "message": "Username atau password salah"}
                HEREDOC;
            }
        } else {
            $response = Users::login($data->username, $data->password);
            if ($response->statusCode === 200) {
                $_SESSION["username"] = $data->username;
                Users::updateLastLogin($data->username);
                echo <<<HEREDOC
                    {"loginStatus": "success", "message": "$response->message"}
                HEREDOC;
            } else {
                echo <<<HEREDOC
                    {"loginStatus": "failed", "message": "$response->message"}
                HEREDOC;
            }
        }
    }
    
?>