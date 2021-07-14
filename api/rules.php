<?php

header('Content-Type: application/json');

require_once "classes/Rules.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Rules::get($_GET["id"]);
            } else {
                $response = Rules::getAll();
            }
        } else {
            $response = Rules::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = Rules::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = Rules::badRequest();
            }
        break;

    case "PUT":
            if (isset($_GET["id"]) && file_get_contents("php://input") !== null) {
                $response = Rules::update($_GET["id"], json_decode(file_get_contents("php://input")));
            } else {
                $response = Rules::badRequest();
            }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = Rules::delete($_GET["id"]);
        } else {
            $response = Rules::badRequest();
        }
        break;
}

echo json_encode($response);