<?php

header('Content-Type: application/json');

require_once "classes/InterestsV2.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = InterestsV2::get($_GET["id"]);
            } else {
                if (isset($_GET["random"])) {
                    $response = InterestsV2::getAll("rand()");
                } else {
                    $response = InterestsV2::getAll();
                }
            }
        } else {
            $response = InterestsV2::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = InterestsV2::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = InterestsV2::badRequest();
            }
        break;

    case "PUT":
            if (isset($_GET["id"]) && file_get_contents("php://input") !== null) {
                $response = InterestsV2::update($_GET["id"], json_decode(file_get_contents("php://input")));
            } else {
                $response = InterestsV2::badRequest();
            }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = InterestsV2::delete($_GET["id"]);
        } else {
            $response = InterestsV2::badRequest();
        }
        break;
}

echo json_encode($response);