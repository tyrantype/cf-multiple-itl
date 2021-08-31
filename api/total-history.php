<?php
require_once "classes/Database.php";

$sql = "
SELECT 
    t.name,
    COUNT(r.id) total
FROM results r
RIGHT JOIN types t
ON t.id = r.type_id
GROUP BY t.id;";
$result = Database::query($sql);

echo json_encode($result);