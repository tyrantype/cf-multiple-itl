<?php

require_once "Database.php";

class Interests
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                id, 
                name
            FROM 
                interests 
            WHERE 
                id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data minat";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data minat tidak ditemukan";
        }
        return $response;
    }

    public static function getAll(): stdClass
    {
        $sql = "
            SELECT 
                id, 
                name
            FROM 
                interests
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data minat";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data minat kosong";
        }
        return $response;
    }

    public static function create($data): stdClass
    {
        $response = new stdClass();
        
        $countName = (int) Database::query("SELECT COUNT(*) count FROM interests WHERE name = '$data->name'")->data[0]["count"];
        if ($countName < 1) {
            $newID = Interests::getNewID();
            $sql = "
            INSERT INTO 
                interests(id, name) 
            VALUES 
                (
                    '$newID', 
                    '$data->name'
                )
        ";
            $response = Database::query($sql);
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil membuat minat";
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Nama minat telah digunakan";
        }
        return $response;
    }

    private static function getLastID(): string {
        $sql = "SELECT id FROM interests ORDER BY id DESC LIMIT 1";
        $response = Database::query($sql);
        if (isset($response->data[0])) {
            return $response->data[0]["id"];
        } else {
            return "I0000";
        }
    }

    private static function getNewID(): string {
        $lastNumber = intval(substr(Interests::getLastID(), 1)) + 1;
        $newID = "";
        if ($lastNumber < 10) {
            $newID = "I000$lastNumber";
        } elseif ($lastNumber < 100) {
            $newID = "I00$lastNumber";
        } elseif ($lastNumber < 1000) {
            $newID = "I0$lastNumber";
        } elseif ($lastNumber < 10000) {
            $newID = "I$lastNumber";
        }
        return $newID;
    }

    public static function update($id, $data): stdClass {
        $tempInterest = Interests::get($id);
        if ($tempInterest->statusCode !== 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal mengubah data minat (Not Found)";
            return $response;
        }

        $sql = "
            SELECT
                COUNT(*) count
            FROM 
                interests
            WHERE
                name = '$data->name'
            AND
                id <> '". $tempInterest->data[0]["id"] ."'
        ";
        $countName = (int) Database::query($sql)->data[0]["count"];

        if($countName < 1) {
            $sql = "
                UPDATE
                    interests
                SET
                    name = '$data->name'
                WHERE
                    id = '". $tempInterest->data[0]["id"] ."'

            ";

            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah data minat";
            http_response_code(200);
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Nama minat telah digunakan";
        }
        return $response;
    }

    public static function delete($id) {
        $tempInterest = Interests::get($id);
        if ($tempInterest->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data minat (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    interests
                WHERE 
                    id = '$id'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus data minat";
            http_response_code(200);
        }
        return $response;
    }

    public static function badRequest() {
        http_response_code(400);
        $response = new stdClass();
        $response->statusCode = 400;
        $response->message = "Input tidak ada atau tidak lengkap";
        return $response;
    }
}
