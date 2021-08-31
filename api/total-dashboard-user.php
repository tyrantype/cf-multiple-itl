<?php
session_start();
require_once "classes/Database.php";

$sql = "
SELECT
    (SELECT COUNT(*) FROM types) types,
    (SELECT COUNT(*) FROM interests_v2) rules,
    (SELECT COUNT(*) FROM results INNER JOIN users ON users.id = results.user_id WHERE users.username = $_SESSION[username]) history
";
$result = Database::query($sql);

echo json_encode($result);