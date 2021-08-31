<?php
require_once "classes/Database.php";

$sql = "
SELECT
    (SELECT COUNT(*) FROM users) users,
    (SELECT COUNT(*) FROM types) types,
    (SELECT COUNT(*) FROM interests_v2) rules,
    (SELECT COUNT(*) FROM results) history
";
$result = Database::query($sql);

echo json_encode($result);