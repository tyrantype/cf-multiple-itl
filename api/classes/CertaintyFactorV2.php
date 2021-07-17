<?php

require_once "Database.php";
require_once "TypesPictures.php";

class CertaintyFactorV2 {

    public static function calculate($userInterests) {
        $userInterests = CertaintyFactorV2::getData($userInterests);
        $types = CertaintyFactorV2::groupInterestsByType($userInterests);
        $types = CertaintyFactorV2::calculateCF($types);
        usort($types, function($a, $b) {return $a["cf"] < $b["cf"];});

        $selectedRules = $userInterests;


        http_response_code(200);
        $response = new stdClass();
        $response->statusCode = 200;
        $response->data = new stdClass();
        $response->data->result = $types;
        $response->data->selectedRules = $selectedRules;
        $response->message = "Success";
        return $response;
    }

    private static function getData($userInterests): array {
        // Result : (id, name, type_id, type_name, type_detail, type_advice, type_fields, mb, md)
        $result = [];
        for ($i = 0; $i < count($userInterests); $i++) {
            $sql = "
            SELECT 
                i.id id,
                i.name name, 
                i.type_id typeId, 
                t.name typeName,
                t.detail typeDetail,
                t.advice typeAdvice,
                t.fields typeFields,
                i.mb mb
            FROM interests_v2 i
            INNER JOIN
                types t
                ON
                t.id = i.type_id
            WHERE 
                i.id = '" . $userInterests[$i]->id . "'"
            ;
            $data = Database::query($sql)->data[0];
            $data["mb"] = (float) $data["mb"];
            $data["md"] = (float) $userInterests[$i]->userCF;
            $result[] = $data;
        }

        return $result;
    }

    private static function groupInterestsByType($userInterests): array {
        $temp = [];
        foreach ($userInterests as $userInterest) {
            $temp[$userInterest["typeId"]] = [
                "name" => $userInterest["typeName"],
                "detail" => $userInterest["typeDetail"],
                "advice" => $userInterest["typeAdvice"],
                "fields" => $userInterest["typeFields"]
            ];
        }

        $types = [];
        foreach ($temp as $key => $value) {
            $tempType["id"] = $key;
            $tempType["name"] = $value["name"];
            $tempType["detail"] = $value["detail"];
            $tempType["advice"] = $value["advice"];
            $tempType["fields"] = $value["fields"];
            
            $tempType["rules"] = [];
            foreach ($userInterests as $userInterest) {
                if ($tempType["id"] === $userInterest["typeId"]) {
                    $cf = $userInterest["mb"] * $userInterest["md"];
                    $tempRule = [
                        "id" => $userInterest["id"],
                        "name" => $userInterest["name"],
                        "mb" => (float) $userInterest["mb"],
                        "md" => (float) $userInterest["md"],
                        "formula" => "$userInterest[mb] x $userInterest[md] = $cf",
                        "cf" => $cf
                    ];
                    $tempType["rules"][] = $tempRule;
                }
            }
            $sql = "
                SELECT
                    tp.id,
                    tp.file_name fileName
                FROM 
                    types_pictures tp
                WHERE
                    tp.type_id = '$tempType[id]'
            ";
            $pictures = Database::query($sql)->data;
            $tempType["pictures"] = $pictures;

            $types[] = $tempType;
        }
        return $types;
    }

    private static function calculateCF($types): array {
        $result = [];
        foreach ($types as $type) {
            $combination = [];
            if (count($type["rules"]) <= 1) {
                $combination[] = [
                    "formula" => "-",
                    "cf" => floatval($type["rules"][0]["cf"])
                ];
            } else {
                for ($i = 0; $i < count($type["rules"]); $i++) {
                    if ($i < 2) {
                        $cf1 = $type["rules"][0]["cf"];
                        $cf2 = $type["rules"][1]["cf"];
                        $cfEnd = $cf1 + $cf2 - ($cf1 * $cf2);
                        $cfEnd = floatval(number_format($cfEnd, 5, '.', ',')); 
                        $combination[] = [
                            "formula" => "$cf1  +  $cf2 - ($cf1 * $cf2) = $cfEnd",
                            "cf" => $cfEnd
                        ];
                        $i = 1;
                    }  else {
                        $cf1 = end($combination)["cf"];
                        $cf2 = $type["rules"][$i]["cf"];
                        $cfEnd = $cf1 + $cf2 - ($cf1 * $cf2);
                        $cfEnd = floatval(number_format($cfEnd, 5, '.', ',')); 
                        $combination[] = [
                            "formula" => "$cf1  +  $cf2 - ($cf1 * $cf2) = $cfEnd",
                            "cf" => $cfEnd
                        ];
                    }
                }
            }
            $type["combinations"] = $combination;
            $type["cf"] = end($combination)["cf"];
            $result[] = $type;
        }
        return $result;
    }

    public static function badRequest(): stdClass {
        http_response_code(400);
        $response = new stdClass();
        $response->statusCode = 400;
        $response->message = "Input tidak ada atau tidak lengkap";
        return $response;
    }
}