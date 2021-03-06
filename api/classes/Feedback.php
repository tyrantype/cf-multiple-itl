<?php

require_once "Database.php";
require_once "Users.php";

class Feedback
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                f.id_feedback id, 
                f.id_user userId,
                u.username username,
                u.nama_lengkap fullname,
                f.isi_feedback content,
                f.tanggal datetime,
                u.id_avatar avatarId
                FROM 
                feedback f
            INNER JOIN
                user u
                ON
                u.id_user = f.id_user
            WHERE 
                f.id_feedback = '$id'
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
                f.id_feedback id, 
                f.id_user userId,
                u.username username,
                u.nama_lengkap fullname,
                f.isi_feedback content,
                f.tanggal datetime,
                u.id_avatar avatarId
                FROM 
                feedback f
            INNER JOIN
                user u
                ON
                u.id_user = f.id_user
            WHERE 
                f.id_user = '$id'
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
                f.id_feedback id, 
                f.id_user userId,
                u.username username,
                u.nama_lengkap fullname,
                f.isi_feedback content,
                f.tanggal datetime,
                u.id_avatar avatarId
                FROM 
                feedback f
            INNER JOIN
                user u
                ON
                u.id_user = f.id_user
            ORDER BY f.tanggal DESC
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

    public static function create($username, $data): stdClass
    {
        $response = new stdClass();
        $user = Users::get($username);
        $user = $user->data[0]["id"];
        $sql = "
            INSERT INTO 
                feedback(id_user, isi_feedback) 
            VALUES 
                (
                    '$user',
                    '$data->content'
                )
        ";
        $response = Database::query($sql);
        $response->statusCode = 200;
        $response->message = "Berhasil mengirim feedback";
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
                    id_feedback = '$id'
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
