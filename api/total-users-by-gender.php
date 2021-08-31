<?php
require_once "classes/Database.php";

$sql = "
SELECT 
    gender,
    COUNT(gender) / (SELECT COUNT(*) FROM users) * 100  percentage
FROM users
group by gender";
$result = Database::query($sql);

echo json_encode($result);