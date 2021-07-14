<?php

header('Content-Type: application/json');

require_once "classes/Fields.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Fields::get($_GET["id"]);
            } else {
                $response = Fields::getAll();
            }
        } else {
            $response = Fields::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = Fields::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = Fields::badRequest();
            }
        break;

    case "PUT":
            if (isset($_GET["id"]) && file_get_contents("php://input") !== null) {
                $response = Fields::update($_GET["id"], json_decode(file_get_contents("php://input")));
            } else {
                $response = Fields::badRequest();
            }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = Fields::delete($_GET["id"]);
        } else {
            $response = Fields::badRequest();
        }
        break;
}

echo json_encode($response);