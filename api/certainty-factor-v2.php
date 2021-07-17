<?php

header('Content-Type: application/json');

require_once "classes/CertaintyFactorV2.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "POST":
        if (file_get_contents("php://input") !== null) {
            $response = CertaintyFactorV2::calculate(json_decode(file_get_contents("php://input")));
        } else {
            $response = CertaintyFactorV2::badRequest();
        }
    break;
}

echo json_encode($response);