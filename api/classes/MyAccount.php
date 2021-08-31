<?php

require_once "Database.php";
require_once "Users.php";

class MyAccount
{
    public static function get($username): stdClass
    {
        $sql = "
            SELECT 
                *
            FROM 
                users
            WHERE 
                username = '$username'
        ";
        $response = Database::query($sql);
        http_response_code(200);
        $response->statusCode = 200;
        $response->message = "Berhasil mendapatkan data";
        return $response;
    }

    public static function update($username, $data): stdClass
    {
        $count = 0;

        if ($username !== $data->username) {
            $sql = "
                SELECT
                    COUNT(*) count
                FROM 
                    users
                WHERE
                    username = '$data->username'
            ";
            $count = Database::query($sql)->data[0]["count"];
            $count = intval($count);
        }

        if ($count < 1) {
            $sql = "
                UPDATE
                    users
                SET 
                    username = '$data->username',
                    full_name = '$data->fullName',
                    gender = '$data->gender',
                    date_of_birth = '$data->dateOfBirth',
                    address = '$data->address',
                    privilege = '$data->privilege',
                    avatar_id = '$data->avatarId'
                WHERE 
                    username = '$username'
            ";

            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah data user";
            http_response_code(200);
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "NIS telah digunakan";
        }
        return $response;
    }

    public static function updateSuperuser($data)
    {
        $response = new stdClass();

        $sql = "
            SELECT
                *
            FROM
                superuser
        ";
        $su = Database::query($sql);
        if (password_verify($data->oldPassword, $su->data[0]["password"])) {
            if (empty($data->newPassword)) {
                $sql = "
                    UPDATE
                        superuser
                    SET 
                        username = '$data->username'
                ";
            } else {
                $hashedPassword = password_hash($data->newPassword, PASSWORD_DEFAULT);
                $sql = "
                    UPDATE
                        superuser
                    SET 
                        username = '$data->username',
                        password = '$hashedPassword'
                ";
            }

            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah password";
            http_response_code(200);
        } else {
            $response->statusCode = 403;
            $response->message = "Password lama salah";
            http_response_code(403);
        }
        return $response;
    }

    public static function changePassword($username, $data)
    {
        $response = new stdClass();
        $newHashedPassword = password_hash($data->newPassword, PASSWORD_DEFAULT);

        $sql = "SELECT password FROM users WHERE username = '$username'";
        $user = Database::query($sql);

        if (password_verify($data->oldPassword, $user->data[0]["password"])) {
            $sql = "
                    UPDATE 
                        users
                    SET
                        password = '$newHashedPassword'
                    WHERE 
                        username = '$username'
                ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah password";
            http_response_code(200);
        } else {
            $response->statusCode = 403;
            $response->message = "Password lama salah";
            http_response_code(403);
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
