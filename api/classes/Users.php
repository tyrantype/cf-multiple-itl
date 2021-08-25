<?php

require_once "Database.php";

class Users
{
    public static function get($username): stdClass
    {
        $sql = "
            SELECT 
                id 'id', 
                full_name 'Nama Lengkap',
                username 'Username',
                gender 'Jenis Kelamin',
                date_of_birth 'Tanggal Lahir',
                address 'Alamat', 
                last_login 'Terakhir Login',
                privilege 'Hak Akses',
                avatar_id 'avatarId'
            FROM 
                users 
            WHERE 
                username = '$username'
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
                id 'id', 
                full_name 'Nama Lengkap',
                username 'Username', 
                gender 'Jenis Kelamin',
                date_of_birth 'Tanggal Lahir',
                address 'Alamat', 
                last_login 'Terakhir Login',
                privilege 'Hak Akses',
                avatar_id 'avatarId'
            FROM 
                users
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data user";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->data = [];
            $response->message = "Data user kosong";
        }
        return $response;
    }

    public static function create($data): stdClass
    {
        $response = new stdClass();
        $tempUser = Users::get($data->username);
        if ($tempUser->statusCode != 200) {
            $newID = Users::getNewID();
            $hashedPassword = password_hash($data->password, PASSWORD_DEFAULT);
            $sql = "
            INSERT INTO 
                users(id, username, password, full_name, gender, date_of_birth, address, privilege, avatar_id) 
            VALUES 
                (
                    '$newID', 
                    '$data->username', 
                    '$hashedPassword', 
                    '$data->fullName',
                    '$data->gender',
                    '$data->dateOfBirth',
                    '$data->address',
                    '$data->privilege',
                    '$data->avatarId'
                )
        ";
            $response = Database::query($sql);
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil membuat user";
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Username telah digunakan";
        }
        return $response;
    }

    private static function getLastID(): string {
        $sql = "SELECT id FROM users ORDER BY id DESC LIMIT 1";
        $response = Database::query($sql);
        if (isset($response->data[0])) {
            return $response->data[0]["id"];
        } else {
            return "U0000";
        }
    }

    private static function getNewID(): string {
        $lastNumber = intval(substr(Users::getLastID(), 1)) + 1;
        $newID = "";
        if ($lastNumber < 10) {
            $newID = "U000$lastNumber";
        } elseif ($lastNumber < 100) {
            $newID = "U00$lastNumber";
        } elseif ($lastNumber < 1000) {
            $newID = "U0$lastNumber";
        } elseif ($lastNumber < 10000) {
            $newID = "U$lastNumber";
        }
        return $newID;
    }

    public static function update($username, $data): stdClass {
        $userData = Users::get($username);
        if ($userData->statusCode !== 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal mengubah data user (Not Found)";
            return $response;
        }

        $sql = "
            SELECT
                COUNT(*) count
            FROM 
                users
            WHERE
                username = '$data->username'
            AND
                id <> '". $userData->data[0]["id"] ."'
        ";
        $countUsername = Database::query($sql)->data[0]["count"];
        $countUsername = intval($countUsername);

        if($countUsername < 1) {
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
                    id = '". $userData->data[0]["id"] ."'

            ";

            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil mengubah data user";
            http_response_code(200);
        } else {
            $response = new stdClass();
            http_response_code(409);
            $response->statusCode = 409;
            $response->message = "Username telah digunakan";
        }
        return $response;
    }

    public static function passwordReset($username) {
        $tempUser = Users::get($username);
        if ($tempUser->statusCode != 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal reset password (Not Found)";
        } else {
            $length = 8;
            $newPassword = substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyz', ceil($length/strlen($x)) )),1,$length);
            $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
            $sql = "
                UPDATE 
                    users
                SET
                    password = '$hashedPassword'
                WHERE 
                    username = '$username'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->data[0]["newPassword"] = $newPassword;
            $response->message = "Berhasil mereset password";
            http_response_code(200);
        }
        return $response;
    }

    public static function delete($username) {
        $tempUser = Users::get($username);
        if ($tempUser->statusCode != 200) {
            $response = new stdClass();
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Gagal menghapus user (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    users
                WHERE 
                    username = '$username'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus user";
            http_response_code(200);
        }
        return $response;
    }

    public static function login($username, $password): stdClass
    {
        $sql = "
            SELECT 
                password,
                privilege
            FROM 
                users 
            WHERE 
                username = '$username'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            if (password_verify($password, $response->data[0]["password"])) {
                http_response_code(200);
                $response->statusCode = 200;
                $response->message = "Login berhasil";
            } else {
                http_response_code(404);
                $response->statusCode = 404;
                $response->message = "Login gagal";
            }
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Login gagal";
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
