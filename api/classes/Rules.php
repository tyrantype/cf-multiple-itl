<?php

require_once "Database.php";

class Rules
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                k.id id, 
                k.type_id typeId,
                t.name typeName,
                k.interest_id interestId,
                i.name interestName,
                k.mb mb
            FROM 
                rules k
            INNER JOIN
                types t
                ON
                t.id = k.type_id
            INNER JOIN
                interests i
                ON 
                i.id = k.interest_id
            WHERE 
                k.id = '$id'
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
                k.id id, 
                k.type_id typeId,
                t.name typeName,
                k.interest_id interestId,
                i.name interestName,
                k.mb mb
            FROM 
                rules k
            INNER JOIN
                types t
                ON
                t.id = k.type_id
            INNER JOIN
                interests i
                ON 
                i.id = k.interest_id
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
        
        $isDuplicate = Rules::isDuplicate($data->typeId, $data->interestId);

        if ($isDuplicate) {
            $response->statusCode = 409;
            $response->message = "Tipe dan minat bakat telah digunakan";
            http_response_code(409);
        } else {
            $newID = Rules::getNewID();
            $sql = "
            INSERT INTO 
                rules(id, type_id, interest_id, mb) 
            VALUES 
                (
                    '$newID', 
                    '$data->typeId',
                    '$data->interestId',
                    '$data->mb'
                )
        ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil membuat pengetahuan";
            http_response_code(200);
        }
        return $response;
    }

    private static function isDuplicate($typeId, $interestId): bool {
        $sql = "
            SELECT
                COUNT(*) count
            FROM
                rules
            WHERE
                type_id = '$typeId'
                AND
                interest_id = '$interestId'
        ";
        $count = (int) Database::query($sql)->data[0]["count"];
        return $count > 0 ? true : false;
    }

    private static function getLastID(): string {
        $sql = "SELECT id FROM rules ORDER BY id DESC LIMIT 1";
        $response = Database::query($sql);
        if (isset($response->data[0])) {
            return $response->data[0]["id"];
        } else {
            return "RL0000";
        }
    }

    private static function getNewID(): string {
        $lastNumber = intval(substr(Rules::getLastID(), 2)) + 1;
        $newID = "";
        if ($lastNumber < 10) {
            $newID = "RL000$lastNumber";
        } elseif ($lastNumber < 100) {
            $newID = "RL00$lastNumber";
        } elseif ($lastNumber < 1000) {
            $newID = "RL0$lastNumber";
        } elseif ($lastNumber < 10000) {
            $newID = "RL$lastNumber";
        }
        return $newID;
    }

    public static function update($id, $data): stdClass {
        $tempKnowledge = Rules::get($id);
        if ($tempKnowledge->statusCode !== 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal mengubah data pengetahuan (Not Found)";
            return $response;
        }

        $sql = "
            SELECT
                COUNT(*) count
            FROM 
                rules
            WHERE
                type_id = '$data->typeId'
                AND
                interest_id = '$data->interestId'
                AND
                id <> '". $tempKnowledge->data[0]["id"] ."'
        ";
        $count = (int) Database::query($sql)->data[0]["count"];

        if($count < 1) {
            $sql = "
                UPDATE
                    rules
                SET
                    type_id = '$data->typeId',
                    interest_id = '$data->interestId',
                    mb = '$data->mb'
                WHERE
                    id = '". $tempKnowledge->data[0]["id"] ."'

            ";

            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah data pengetahuan";
            http_response_code(200);
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Tipe dan minat bakat telah digunakan";
        }
        return $response;
    }

    public static function delete($id) {
        $tempKnowledge = Rules::get($id);
        if ($tempKnowledge->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data pengetahuan (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    rules
                WHERE 
                    id = '$id'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus data pengetahuan";
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
