<?php

require_once "Database.php";
require_once "TypesPictures.php";
class Types
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                id, 
                name,
                detail,
                advice,
                fields
            FROM 
                types 
            WHERE 
                id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            $sql = "
                SELECT
                    id,
                    type_id typeId,
                    file_name fileName
                FROM
                    types_pictures
                WHERE
                    type_id = '$id'
            ";
            $temp = Database::query($sql);
            
            if (isset($temp->data)) {
                $response->data[0]["pictures"] = $temp->data;
            }

            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data tidak ditemukan";
        }
        return $response;
    }

    public static function getAll(): stdClass
    {
        $sql = "
            SELECT 
                id, 
                name,
                detail,
                advice,
                fields
            FROM 
                types
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            for ($i = 0; $i < count($response->data); $i++) {
                $sql = "
                    SELECT
                        id,
                        type_id typeId,
                        file_name fileName
                    FROM
                        types_pictures
                    WHERE
                        type_id = '" . $response->data[$i]["id"] . "'";
                $temp = Database::query($sql);
                
                if (isset($temp->data)) {
                    $response->data[$i]["pictures"] = $temp->data;
                }
            }

            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data tipe";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data tipe kosong";
        }
        return $response;
    }

    public static function create($data): stdClass
    {
        $response = new stdClass();
        
        $countName = (int) Database::query("SELECT COUNT(*) count FROM types WHERE name = '$data->name'")->data[0]["count"];
        if ($countName < 1) {
            $newID = Types::getNewID();
            $sql = "
            INSERT INTO 
                types(id, name, detail, advice, fields) 
            VALUES 
                (
                    '$newID', 
                    '$data->name',
                    '$data->detail',
                    '$data->advice',
                    '$data->fields'
                )
        ";
            $response = Database::query($sql);
            http_response_code(200);
            $response->statusCode = 200;
            $response->insertId = $newID;
            $response->message = "Berhasil membuat tipe";
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Nama tipe telah digunakan";
        }
        return $response;
    }

    private static function getLastID(): string {
        $sql = "SELECT id FROM types ORDER BY id DESC LIMIT 1";
        $response = Database::query($sql);
        if (isset($response->data[0])) {
            return $response->data[0]["id"];
        } else {
            return "T0000";
        }
    }

    private static function getNewID(): string {
        $lastNumber = intval(substr(Types::getLastID(), 1)) + 1;
        $newID = "";
        if ($lastNumber < 10) {
            $newID = "T000$lastNumber";
        } elseif ($lastNumber < 100) {
            $newID = "T00$lastNumber";
        } elseif ($lastNumber < 1000) {
            $newID = "T0$lastNumber";
        } elseif ($lastNumber < 10000) {
            $newID = "T$lastNumber";
        }
        return $newID;
    }

    public static function update($id, $data): stdClass {
        $tempType = Types::get($id);
        if ($tempType->statusCode !== 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal mengubah data tipe (Not Found)";
            return $response;
        }

        $sql = "
            SELECT
                COUNT(*) count
            FROM 
                types
            WHERE
                name = '$data->name'
            AND
                id <> '". $tempType->data[0]["id"] ."'
        ";
        $countName = (int) Database::query($sql)->data[0]["count"];

        if($countName < 1) {
            $sql = "
                UPDATE
                    types
                SET
                    name = '$data->name',
                    detail = '$data->detail',
                    advice = '$data->advice',
                    fields = '$data->fields'
                WHERE
                    id = '". $tempType->data[0]["id"] ."'

            ";

            $response = Database::query($sql);
            $response->id = $id;
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah data tipe";
            http_response_code(200);
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Nama tipe telah digunakan";
        }
        return $response;
    }

    public static function delete($id) {
        $tempType = Types::get($id);
        if ($tempType->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data tipe (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    types
                WHERE 
                    id = '$id'
            ";
            TypesPictures::delete($id);
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus data tipe";
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
