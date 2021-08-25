<?php
require_once "classes/Users.php";

$response = Users::create(json_decode(file_get_contents("php://input")));

echo json_encode($response);