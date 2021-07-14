<?php

header('Content-Type: application/json');

require_once "classes/Users.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "PATCH":
            if (isset($_GET["username"])) {
                $response = Users::passwordReset($_GET["username"]);
            } else {
                $response = Users::badRequest();
            }
        break;
}

echo json_encode($response);