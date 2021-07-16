<?php

require_once "Database.php";

class TypesPictures
{
    public static function get($id): stdClass
    {
        $sql = "
            SELECT 
                id, 
                type_id typeId,
                file_name fileName
            FROM 
                types_pictures
            WHERE 
                id = '$id'
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
                id, 
                type_id typeId,
                file_name fileName
            FROM 
                types_pictures
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data gambar tipe";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data gambar tipe kosong";
        }
        return $response;
    }

    private static function getNewId()
    {
        $sql = "
            SELECT
                id
            FROM
                types_pictures
            ORDER BY
                id DESC
            LIMIT 1
        ";
        $response = Database::query($sql);
        return $response->data[0]["id"];
    }

    public static function insert($newId, $typeId, $newName)
    {
        $sql = "
            INSERT INTO
                types_pictures (id, type_id, file_name)
            VALUES (
                '$newId',
                '$typeId',
                '$newName'
            )
        ";
        $response = Database::query($sql);
    }

    public static function upload($typeId, $deleteAll)
    {
        $target_dir = "../assets/images/types/";
        $newId = intval(TypesPictures::getNewId()) + 1;
        $filename = basename($_FILES["filepond"]["name"]);
        $imageFileType = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
        $newName = $typeId  . "-" . $newId . "." . $imageFileType;
        $target_file = $target_dir . $newName;
        $uploadOk = 1;

        // Check if image file is a actual image or fake image
        if (isset($_POST["submit"])) {
            $check = getimagesize($_FILES["filepond"]["tmp_name"]);
            if ($check !== false) {
                // echo "File is an image - " . $check["mime"] . ".";
                $uploadOk = 1;
            } else {
                echo "File is not an image.";
                $uploadOk = 0;
            }
        }

        // Check file size
        if ($_FILES["filepond"]["size"] > 500000) {
            echo "Sorry, your file is too large.";
            $uploadOk = 0;
        }

        // Allow certain file formats
        if (
            $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif" && $imageFileType != "svg"
        ) {
            echo "Sorry, only JPG, JPEG, PNG, SVG & GIF files are allowed.";
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            // echo "Sorry, your file was not uploaded.";
            // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["filepond"]["tmp_name"], $target_file)) {
                // echo "The file " . htmlspecialchars(basename($_FILES["filepond"]["name"])) . " has been uploaded.";
                if ($deleteAll) {
                    TypesPictures::delete($typeId);
                }
                TypesPictures::insert($newId, $typeId, $newName);

                $response = new stdClass();
                $response->statusCode = 200;
                $response->message = "Berhasil membuat tipe";
                http_response_code(200);

                return $response;
            } else {
                echo "Sorry, there was an error uploading your file.";
            }
        }
    }

    public static function delete($typeId)
    {
        $sql = "
            SELECT
                file_name
            FROM
                types_pictures
            WHERE
                type_id = '$typeId'
        ";
        $rows = Database::query($sql);
        if (isset($rows->data)) {
            $rows = $rows->data;

            foreach ($rows as $row) {
                $file = "../assets/images/types/" . $row["file_name"];
                if (file_exists($file)) {
                    unlink($file);
                }
            }
            $sql = "
                DELETE FROM
                    types_pictures
                WHERE 
                    type_id = '$typeId'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus data tipe";
            http_response_code(200);

            return $response;
        }
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
