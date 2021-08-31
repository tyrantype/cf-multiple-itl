<?php
session_start();

date_default_timezone_set("Asia/Jakarta");
require_once "Database.php";
require_once "Users.php";

class Results
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                r.id id, 
                r.user_id userId,
                u.username username,
                u.full_name fullName,
                r.type_id typeId,
                t.name typeName,
                r.cf_value cfValue,
                r.datetime datetime,
                u.avatar_id avatarId
            FROM 
                results r
            INNER JOIN
                users u
                ON
                u.id = r.user_id
            INNER JOIN
                types t
            ON
                t.id = r.type_id
            WHERE 
                r.id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data riwayat";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data riwayat tidak ditemukan";
        }
        return $response;
    }

    public static function getAllByUsername($username): stdClass
    {
        $sql = "
            SELECT 
                r.id id, 
                r.user_id userId,
                u.username username,
                u.full_name fullName,
                r.type_id typeId,
                t.name typeName,
                r.cf_value cfValue,
                r.datetime datetime,
                u.avatar_id avatarId
            FROM 
                results r
            INNER JOIN
                users u
                ON
                u.id = r.user_id
            INNER JOIN
                types t
            ON
                t.id = r.type_id
            WHERE 
                u.username = '$username'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data riwayat";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data riwayat tidak ditemukan";
        }
        return $response;
    }

    public static function getAll(): stdClass
    {
        $sql = "
            SELECT 
                r.id id, 
                r.user_id userId,
                u.username username,
                u.full_name fullName,
                r.type_id typeId,
                t.name typeName,
                r.cf_value cfValue,
                r.datetime datetime,
                u.avatar_id avatarId
            FROM 
                results r
            INNER JOIN
                users u
                ON
                u.id = r.user_id
            INNER JOIN
                types t
            ON
                t.id = r.type_id
            ORDER BY
                r.datetime DESC
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data riwayat";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data riwayat kosong";
        }
        return $response;
    }

    public static function create($typeId, $cfValue): stdClass
    {
        global $superuser;
        
        $userId = "NULL";
        if (isset($_SESSION["username"]) && $_SESSION["username"] !== $superuser->username) {
            $response = Users::get($_SESSION["username"]);
            $userId = "'" . $response->data[0]["id"] . "'";
        }

        $newID = Results::getNewID();
        $sql = "
            INSERT INTO 
                results(id, user_id, type_id, cf_value) 
            VALUES 
                (
                    '$newID', 
                    $userId,
                    '$typeId',
                    '$cfValue'
                )
        ";
        
        $response = Database::query($sql);
        $response->statusCode = 200;
        $response->message = "Berhasil membuat riwayat";
        $response->insertId = $newID;
        http_response_code(200);
        return $response;
    }

    private static function getLastID(): string
    {
        $sql = "SELECT id FROM results ORDER BY id DESC LIMIT 1";
        $response = Database::query($sql);
        if (isset($response->data[0])) {
            return $response->data[0]["id"];
        } else {
            return "R0000";
        }
    }

    private static function getNewID(): string
    {
        $lastNumber = intval(substr(Results::getLastID(), 1)) + 1;
        $newID = "";
        if ($lastNumber < 10) {
            $newID = "R000$lastNumber";
        } elseif ($lastNumber < 100) {
            $newID = "R00$lastNumber";
        } elseif ($lastNumber < 1000) {
            $newID = "R0$lastNumber";
        } elseif ($lastNumber < 10000) {
            $newID = "R$lastNumber";
        }
        return $newID;
    }

    public static function setCFValue($resultId, $value) {
        $response = new stdClass();
        $temp = Results::get($resultId);
        if ($temp->statusCode != 200) {
            $response->statusCode = 404;
            $response->message = "Gagal menset cf_value (Results ID Not Found)";
            http_response_code(404);
        } else {
            $sql = "
                UPDATE
                    results
                SET
                    cf_value = $value
                WHERE
                    result_id = '$resultId'    
                ;";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menset cf_value";
            http_response_code(200);
        }
        return $response;
    }

    public static function delete($id)
    {
        $tempInterest = Results::get($id);
        if ($tempInterest->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data riwayat (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    results
                WHERE 
                    id = '$id'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus riwayat";
            http_response_code(200);
        }
        return $response;
    }

    public static function badRequest()
    {
        http_response_code(400);
        $response = new stdClass();
        $response->statusCode = 400;
        $response->message = "Input tidak ada atau tidak lengkap";
        return $response;
    }
}
