<?php
// $newPassword = substr(str_replace(['+', '/', '='], '', base64_encode(random_bytes(6))), 0, 6); // 32 characters, without /=+
$length = 6;
$newPassword = substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyz', ceil($length/strlen($x)) )),1,$length);

echo $newPassword;