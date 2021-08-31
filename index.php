<?php
session_start();

require_once "api/classes/Users.php";

if (isset($_SESSION["username"])) {

    if ($_SESSION["username"] === $superuser->username) {
        header("Location: ./admin");
    } else {
        $response = Users::get($_SESSION["username"]);
    
        if ($response->statusCode === 200) {
            if ($response->data[0]["Hak Akses"] === "Admin") header("Location: ./admin");
            else header("Location: ./user");
        }
        die();
    }
} else {
    if (isset($_GET["page"])) {
        switch ($_GET["page"]) {
          case "login":
            require_once "auth/login.html";
            die();
            break;
          case "register":
            require_once "auth/register.html";
            die();
            break;
        }
      } else {
        header("Location: homepage");
    }
}