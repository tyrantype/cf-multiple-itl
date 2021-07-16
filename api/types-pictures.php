<?php

header('Content-Type: application/json');

require_once "classes/TypesPictures.php";

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (isset($_GET["view"])) {
            if ($_GET["view"] == "single") {
                $response = TypesPictures::get($_GET["id"]);
            } else {
                $response = TypesPictures::getAll();
            }
        } else {
            $response = TypesPictures::badRequest();
        }
        break;

    case "POST":
        $typeId = json_decode($_POST["filepond"])->typeId;
        $deleteAll = json_decode($_POST["filepond"])->deleteAll;
        $response = TypesPictures::upload($typeId, $deleteAll);
        break;
}

echo json_encode($response);
