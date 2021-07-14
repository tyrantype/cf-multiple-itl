<?php

header('Content-Type: application/json');

require_once "classes/Interests.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Interests::get($_GET["id"]);
            } else {
                $response = Interests::getAll();
            }
        } else {
            $response = Interests::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = Interests::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = Interests::badRequest();
            }
        break;

    case "PUT":
            if (isset($_GET["id"]) && file_get_contents("php://input") !== null) {
                $response = Interests::update($_GET["id"], json_decode(file_get_contents("php://input")));
            } else {
                $response = Interests::badRequest();
            }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = Interests::delete($_GET["id"]);
        } else {
            $response = Interests::badRequest();
        }
        break;
}

echo json_encode($response);