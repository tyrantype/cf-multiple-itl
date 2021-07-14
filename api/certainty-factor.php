<?php

header('Content-Type: application/json');

require_once "classes/CertaintyFactor.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "POST":
        if (file_get_contents("php://input") !== null) {
            $response = CertaintyFactor::calculate(json_decode(file_get_contents("php://input")));
        } else {
            $response = CertaintyFactor::badRequest();
        }
    break;
}

echo json_encode($response);