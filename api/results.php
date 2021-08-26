<?php

header('Content-Type: application/json');

require_once "classes/Results.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Results::get($_GET["id"]);
            } else {
                if (isset($_GET["username"])) {
                    $response = Results::getAllByUsername($_GET["username"]);
                } else {
                    $response = Results::getAll();
                }
            }
        } else {
            $response = Results::badRequest();
        }
        break;

    case "POST":
            // if (file_get_contents("php://input") !== null) {
            //     $response = Results::create(json_decode(file_get_contents("php://input")));
            // } else {
            //     $response = Results::badRequest();
            // }
        break;

    case "DELETE":
        if (isset($_GET["id"])) {
            $response = Results::delete($_GET["id"]);
        } else {
            $response = Results::badRequest();
        }
        break;
}

echo json_encode($response);