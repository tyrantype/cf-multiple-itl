<?php
    session_start();

    require_once "classes/Users.php";

    $result = Users::terimaUser($_GET["username"]);
    echo <<<HEREDOC
        {"statusCode": 200, "message": "$result->message"}
    HEREDOC;