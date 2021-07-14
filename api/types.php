<?php

header('Content-Type: application/json');

require_once "classes/Types.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Types::get($_GET["id"]);
            } else {
                $response = Types::getAll();
            }
        } else {
            $response = Types::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = Types::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = Types::badRequest();
            }
        break;

    case "PUT":
            if (isset($_GET["id"]) && file_get_contents("php://input") !== null) {
                $response = Types::update($_GET["id"], json_decode(file_get_contents("php://input")));
            } else {
                $response = Types::badRequest();
            }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = Types::delete($_GET["id"]);
        } else {
            $response = Types::badRequest();
        }
        break;
}

echo json_encode($response);