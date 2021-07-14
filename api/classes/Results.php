<?php

date_default_timezone_set("Asia/Jakarta");
require_once "Database.php";

class Results
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                r.id id, 
                r.user_id userId,
                u.full_name fullName,
                r.datetime datetime,
                r.cf_value cfValue
            FROM 
                results r
            INNER JOIN
                users u
                ON
                u.id = r.user_id
            WHERE 
                r.id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data hasil";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data hasil tidak ditemukan";
        }
        return $response;
    }

    public static function getAll(): stdClass
    {
        $sql = "
            SELECT 
                r.id id, 
                r.user_id userId,
                u.full_name fullName,
                r.datetime datetime,
                r.cf_value cfValue
            FROM 
                results r
            INNER JOIN
                users u
                ON
                u.id = r.user_id
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data hasil";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data hasil kosong";
        }
        return $response;
    }

    public static function create($data): stdClass
    {
        $newID = Results::getNewID();
        $dateTime = date('Y-m-d H:i:s', time());
        $sql = "
            INSERT INTO 
                results(id, user_id, datetime) 
            VALUES 
                (
                    '$newID', 
                    '$data->userId',
                    '$dateTime'
                )
        ";
        
        $response = Database::query($sql);
        $response->statusCode = 200;
        $response->message = "Berhasil membuat hasil";
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
            $response->message = "Gagal menghapus data hasil (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    results
                WHERE 
                    id = '$id'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus hasil";
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
