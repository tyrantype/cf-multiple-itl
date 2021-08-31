<?php

require_once "Database.php";

class Setting
{
    public static function get(): stdClass
    {
        $sql = "
            SELECT 
                school_name schoolName,
                address
            FROM 
                setting
            WHERE 
                id = 1
        ";
        $response = Database::query($sql);
        http_response_code(200);
        $response->statusCode = 200;
        $response->message = "Berhasil mendapatkan data";
        return $response;
    }

    public static function update($data): stdClass
    {
        $sql = "
            UPDATE
                setting
            SET 
                school_name = '$data->schoolName',
                address = '$data->address'
            WHERE 
                id = 1
        ";
        $response = Database::query($sql);
        http_response_code(200);
        $response->statusCode = 200;
        $response->message = "Berhasil mengubah data";
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
