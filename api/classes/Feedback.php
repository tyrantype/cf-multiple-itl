<?php

require_once "Database.php";

class Feedback
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                f.id id, 
                f.user_id userId,
                u.username username,
                u.full_name fullname,
                f.content content,
                f.datetime datetime,
                u.avatar_id avatarId
                FROM 
                feedback f
            INNER JOIN
                users u
                ON
                u.id = f.user_id
            WHERE 
                f.id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
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

    public static function getByUserId($id): stdClass
    {
        $sql = "
            SELECT 
                f.id id, 
                f.user_id userId,
                u.username username,
                u.fullname fullname,
                f.content content,
                f.datetime datetime,
                u.avatar_id avatarId
                FROM 
                feedback f
            INNER JOIN
                users u
                ON
                u.id = f.user_id
            WHERE 
                f.user_id = '$id'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
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
                f.id id, 
                f.user_id userId,
                u.username username,
                u.full_name fullname,
                f.content content,
                f.datetime datetime,
                u.avatar_id avatarId
                FROM 
                feedback f
            INNER JOIN
                users u
                ON
                u.id = f.user_id
            ORDER BY f.datetime DESC
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data kosong";
        }
        return $response;
    }

    public static function create($data): stdClass
    {
        $response = new stdClass();
        $sql = "
            INSERT INTO 
                feedback(user_id, content) 
            VALUES 
                (
                    '$data->userId',
                    '$data->content'
                )
        ";
        $response = Database::query($sql);
        $response->statusCode = 200;
        $response->message = "Berhasil menambah data";
        http_response_code(200);

        return $response;
    }

    public static function delete($id)
    {
        $tempKnowledge = Feedback::get($id);
        if ($tempKnowledge->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    feedback
                WHERE 
                    id = '$id'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus data";
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
