<?php

require_once "Database.php";

class Fields
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                f.id id, 
                f.name name,
                f.type_id typeId,
                t.name typeName
            FROM 
                fields f
            INNER JOIN
                types t
            ON
                t.id = f.type_id
            WHERE 
                f.id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data bidang";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data bidang tidak ditemukan";
        }
        return $response;
    }

    public static function getAll(): stdClass
    {
        $sql = "
            SELECT 
                f.id id, 
                f.name name,
                f.type_id typeId,
                t.name typeName
            FROM 
                fields f
            INNER JOIN
                types t
            ON
                t.id = f.type_id
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data bidang";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data bidang kosong";
        }
        return $response;
    }

    public static function create($data): stdClass
    {
        $response = new stdClass();
        
        $countName = (int) Database::query("SELECT COUNT(*) count FROM fields WHERE name = '$data->name'")->data[0]["count"];
        if ($countName < 1) {
            $newID = Fields::getNewID();
            $sql = "
            INSERT INTO 
                fields(id, name, type_id) 
            VALUES 
                (
                    '$newID', 
                    '$data->name',
                    '$data->typeId'
                )
            ";
            $response = Database::query($sql);
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil membuat bidang";
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Nama bidang telah digunakan";
        }
        return $response;
    }

    private static function getLastID(): string {
        $sql = "SELECT id FROM fields ORDER BY id DESC LIMIT 1";
        $response = Database::query($sql);
        if (isset($response->data[0])) {
            return $response->data[0]["id"];
        } else {
            return "F0000";
        }
    }

    private static function getNewID(): string {
        $lastNumber = intval(substr(Fields::getLastID(), 1)) + 1;
        $newID = "";
        if ($lastNumber < 10) {
            $newID = "F000$lastNumber";
        } elseif ($lastNumber < 100) {
            $newID = "F00$lastNumber";
        } elseif ($lastNumber < 1000) {
            $newID = "F0$lastNumber";
        } elseif ($lastNumber < 10000) {
            $newID = "F$lastNumber";
        }
        return $newID;
    }

    public static function update($id, $data): stdClass {
        $tempField = Fields::get($id);
        if ($tempField->statusCode !== 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal mengubah data bidang (Not Found)";
            return $response;
        }

        $sql = "
            SELECT
                COUNT(*) count
            FROM 
                fields
            WHERE
                name = '$data->name'
            AND
                id <> '". $tempField->data[0]["id"] ."'
        ";
        $countName = (int) Database::query($sql)->data[0]["count"];

        if($countName < 1) {
            $sql = "
                UPDATE
                    fields
                SET
                    name = '$data->name',
                    type_id = '$data->typeId'
                WHERE
                    id = '". $tempField->data[0]["id"] ."'

            ";

            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah data bidang";
            http_response_code(200);
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Nama bidang telah digunakan";
        }
        return $response;
    }

    public static function delete($id) {
        $tempField = Fields::get($id);
        if ($tempField->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data bidang (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    fields
                WHERE 
                    id = '$id'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus bidang";
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
