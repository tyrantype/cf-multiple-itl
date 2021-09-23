<?php
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
        case "logout":
            session_start();
            session_destroy();
            header("Location: home");
            break;
    }
    } else {
        header("Location: home");
}