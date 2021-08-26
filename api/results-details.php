<?php

header('Content-Type: application/json');

require_once "classes/ResultsDetails.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = ResultsDetails::get($_GET["id"]);
            } else {
                $response = ResultsDetails::getAll();
            }
        } else {
            $response = ResultsDetails::badRequest();
        }
        break;

    case "POST":
            // if (file_get_contents("php://input") !== null) {
            //     $response = ResultsDetails::create(json_decode(file_get_contents("php://input")));
            // } else {
            //     $response = ResultsDetails::badRequest();
            // }
        break;

    case "DELETE":
        if (isset($_GET["resultId"], $_GET["interestId"])) {
            $response = ResultsDetails::delete($_GET["resultId"], $_GET["interestId"]);
        } else {
            $response = ResultsDetails::badRequest();
        }
        break;
}

echo json_encode($response);