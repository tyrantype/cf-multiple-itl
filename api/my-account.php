<?php

session_start();

header('Content-Type: application/json');

require_once "classes/MyAccount.php";

$response = new stdClass();

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        if (!isset($_SESSION["username"])) {
            $response->data["username"] = "anonymous";
            $response->data["fullName"] = "anonymous";
        } else {
            if ($_SESSION["username"] === $superuser->username) {
                $response->data[0]["username"] = $superuser->username;
                $response->data[0]["Nama Lengkap"] = $superuser->username;
                $response->data[0]["Hak Akses"] = "Admin";
                $response->data[0]["avatarId"] = "0";
            } else {
                $response = MyAccount::get($_SESSION["username"]);
            }
        }
        break;

    case "PATCH":
        if (isset($_SESSION["username"]) && file_get_contents("php://input") !== null) {
            $data = json_decode(file_get_contents("php://input"));
            if ($_SESSION["username"] === $superuser->username) {
                $response = MyAccount::updateSuperuser($data);
                if ($response->statusCode === 200) {
                    $_SESSION["username"] = $data->username;
                }
            } else {
                if (isset($_GET["change-password"])) {
                    $response = MyAccount::changePassword($_SESSION["username"], $data);
                } else {
                    $response = MyAccount::update($_SESSION["username"], $data);
                    if ($response->statusCode === 200) {
                        $_SESSION["username"] = $data->username;
                    }
                }
            }
        } else {
            $response = MyAccount::badRequest();
        }
        break;
}

echo json_encode($response);
