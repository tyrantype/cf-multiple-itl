<?php

header('Content-Type: application/json');

require_once "classes/Setting.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        $response = Setting::get();
        break;

    case "PUT":
            if (file_get_contents("php://input") !== null) {
                $response = Setting::update(json_decode(file_get_contents("php://input")));
            } else {
                $response = Setting::badRequest();
            }
        break;
}

echo json_encode($response);