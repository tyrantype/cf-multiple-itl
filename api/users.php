<?php
session_start();

header('Content-Type: application/json');

require_once "classes/Users.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = Users::get($_GET["username"]);
            } else {
                if (isset($_GET["approval"])) {
                    if ($_GET["approval"]) {
                        $response = Users::getAllByApproval($_GET["approval"]);
                    } else {
                        $response = Users::getAllByApproval($_GET["approval"]);
                    }
                } else {
                    $response = Users::getAll();
                }
            }
        } else {
            $response = Users::badRequest();
        }
        break;

    case "POST":
            if (file_get_contents("php://input") !== null) {
                $response = Users::create(json_decode(file_get_contents("php://input")));
            } else {
                $response = Users::badRequest();
            }
        break;

    case "PATCH":
        if (isset($_GET["username"]) && file_get_contents("php://input") !== null) {
            $data = json_decode(file_get_contents("php://input"));
            $response = Users::update($_GET["username"], $data);
            if ($response->statusCode === 200 && $_SESSION["username"] === $_GET["username"]) {
                $_SESSION["username"] = $data->username;
            }
        } else {
            $response = Users::badRequest();
        }
        break;

    case "DELETE":
        if (isset($_GET["username"])) {
            $response = Users::delete($_GET["username"]);
        } else {
            $response = Users::badRequest();
        }
        break;
}

echo json_encode($response);