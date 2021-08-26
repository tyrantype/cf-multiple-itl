<?php

require_once "Database.php";

class ResultsDetails
{
    public static function get($resultId): stdClass
    {
        $sql = "
            SELECT 
                rd.result_id resultId,
                rd.interest_id interestId,
                i.name interestName,
                rd.value value
            FROM 
                results_details rd
            INNER JOIN
                 interests i
                 ON
                 i.id = rd.interest_id
            WHERE 
                rd.result_id = '$resultId'
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data detail hasil";
        } else {
            http_response_code(404);
            $response->statusCode = 404;
            $response->message = "Data detail hasil tidak ditemukan";
        }
        return $response;
    }

    public static function getAll(): stdClass
    {
        $sql = "
            SELECT 
                rd.result_id resultId,
                rd.interest_id interestId,
                i.name interestName,
                rd.value value
            FROM 
                results_details rd
            INNER JOIN
                interests i
                ON
                i.id = rd.interest_id
        ";
        $response = Database::query($sql);
        if (isset($response->data)) {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Berhasil mendapatkan data detail hasil";
        } else {
            http_response_code(200);
            $response->statusCode = 200;
            $response->message = "Data detail hasil kosong";
        }
        return $response;
    }

    public static function create($resultId, $userInterests): stdClass
    {
        $response = new stdClass();

        for ($i = 0; $i < count($userInterests); $i++) {
            $sql = "
                INSERT INTO 
                    results_details(result_id, interest_id, value) 
                VALUES 
                    ('$resultId', '" . $userInterests[$i]->id . "', '" . $userInterests[$i]->userCF . "')";
            $response = Database::query($sql);
        }
        
        http_response_code(200);
        $response->statusCode = 200;
        $response->message = "Berhasil membuat data detail hasil";
        return $response;
    }

    public static function delete($resultId, $interestId) {
        $tempResult = ResultsDetails::get($resultId, $interestId);
        if ($tempResult->statusCode != 200) {
            http_response_code(404);
            $response = new stdClass();
            $response->statusCode = 404;
            $response->message = "Gagal menghapus data detail hasil (Not Found)";
        } else {
            $sql = "
                DELETE FROM
                    results_details
                WHERE 
                    result_id = '$resultId'
                    AND 
                    interest_id = '$interestId'
            ";
            $response = Database::query($sql);
            $response->statusCode = 200;
            $response->message = "Berhasil menghapus data detail hasil";
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
