<?php

header('Content-Type: application/json');

require_once "classes/Feedback.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Feedback::get($_GET["id"]);
            } else {
                $response = Feedback::getAll();
            }
        } else {
            $response = Feedback::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = Feedback::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = Feedback::badRequest();
            }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = Feedback::delete($_GET["id"]);
        } else {
            $response = Feedback::badRequest();
        }
        break;
}

echo json_encode($response);