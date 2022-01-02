<?php
    session_start();

    require_once "classes/Users.php";

    $result = Users::tolakUser($_GET["username"]);
    echo <<<HEREDOC
        {"statusCode": 200, "message": "$result->message"}
    HEREDOC;