<?php

require_once "Database.php";

class CertaintyFactor {

    public static function calculate($userInterests) {
        $rules = CertaintyFactor::getRulesByUserInterests($userInterests);
        $types = CertaintyFactor::groupRulesByType($rules, $userInterests);
        $types = CertaintyFactor::calculateCF($types);

        http_response_code(200);
        $response = new stdClass();
        $response->statusCode = 200;
        $response->data = $types;
        $response->message = "Success";
        return $response;
    }

    private static function getRulesByUserInterests($userInterests): array {
        $interestsId = [];
        foreach ($userInterests as $userInterest) {
            $interestsId[] = $userInterest->id;
        }

        $interestsId = implode("','", $interestsId);
        
        // Result : (id, type_id, type_name, type_detail, interest_id, interest_name, mb, md)
        $sql = "
            SELECT 
                r.id id, 
                r.type_id typeId, 
                t.name typeName,
                t.detail typeDetail, 
                r.interest_id interestId, 
                i.name interestName, 
                r.mb mb
            FROM rules r
            INNER JOIN
                types t
                ON
                t.id = r.type_id
            INNER JOIN
                interests i
                on
                i.id = r.interest_id

            WHERE 
                r.interest_id
                IN
                (
                    '$interestsId'
                )
        ";
        $rules = Database::query($sql);

        return $rules->data;
    }

    private static function groupRulesByType($rules, $userInterests): array {
        $temp = [];
        foreach ($rules as $rule) {
            $temp[$rule["typeId"]] = [
                "name" => $rule["typeName"],
                "detail" => $rule["typeDetail"]
            ];
        }

        $types = [];
        foreach ($temp as $key => $value) {
            $tempType["id"] = $key;
            $tempType["name"] = $value["name"];
            $tempType["detail"] = $value["detail"];
            
            $tempType["rules"] = [];
            foreach ($rules as $rule) {
                if ($tempType["id"] === $rule["typeId"]) {
                    $interestId = $rule["interestId"];
                    $userCF = array_filter(
                        $userInterests,
                        function ($userInterest) use ($interestId) {
                            return $userInterest->id == $interestId;
                        }
                    );
                    $userCF = current($userCF)->userCF;
                    $cf = (float) $rule["mb"] * $userCF;

                    $tempRule = [
                        "id" => $rule["id"],
                        "interestId" => $rule["interestId"],
                        "interestName" => $rule["interestName"],
                        "mb" => (float) $rule["mb"],
                        "userCF" => $userCF,
                        "formula" => "$rule[mb] x $userCF = $cf",
                        "cf" => $cf
                    ];
                    $tempType["rules"][] = $tempRule;
                }
            }

            $types[] = $tempType;
        }
        
        return $types;



        // $typesId = [];
        // foreach ($rules as $rule) {
        //     $typesId[] = $rule["typeId"];
        // }
        // $typesId = array_unique($typesId);
    
        // $types = [];
        // foreach ($typesId as $typeId) {
        //     $tempType = new stdClass;
        //     $tempType->id = $typeId;
            
        //     // filter rules by type id
        //     $filteredRules = array_filter(
        //         $rules,
        //         function ($rules) use ($typeId) {
        //             return $rules["typeId"] == $typeId;
        //         }
        //     );
    
        //     // Result : (id, type_id, type_name, type_detail, interest_id, interest_name, mb, md)
        //     // map array of rules (object), only include id, interestId, interestName, mb,md, userCF
        //     $mappedRules = array_map(
        //         function ($e) {
        //             $tempRule = new stdClass();
        //             $tempRule->id = $rule->id;
        //             $tempRule->interestId = $rule->interestId;
        //             $tempRule->interestName = $rule->interestName;
        //             $tempRule->mb = $rule->mb;
        //             $tempRule->md = $rule->md;
    
        //             $tempRule->userCF = array_filter(
        //                 $userInterests,
        //                 function ($userInterests) use ($tempRule) {
        //                     return $userInterests->id === $tempRule->interestId;
        //                 }
        //             )[0]->cf;
    
        //             return $tempRule;
        //         },
        //         $filteredRules
        //     );
    
        //     $types[] = $tempType;
        // }
        // return $types;
    }

    private static function calculateCF($types): array {
        $result = [];
        foreach ($types as $type) {
            $combination = [];
            if (count($type["rules"]) <= 1) {
                $combination[] = [
                    "formula" => "-",
                    "cf" => $type["rules"][0]["cf"]
                ];
            } else {
                for ($i = 0; $i < count($type["rules"]); $i++) {
                    if ($i < 2) {
                        $cf1 = $type["rules"][0]["cf"];
                        $cf2 = $type["rules"][1]["cf"];
                        $cfEnd = $cf1 + $cf2 - ($cf1 * $cf2);
                        $cfEnd = number_format($cfEnd, 3, '.', ','); 
                        $combination[] = [
                            "formula" => "$cf1  +  $cf2 - ($cf1 * $cf2) = $cfEnd",
                            "cf" => $cfEnd
                        ];
                        $i = 1;
                    }  else {
                        $cf1 = end($combination)["cf"];
                        $cf2 = $type["rules"][$i]["cf"];
                        $cfEnd = $cf1 + $cf2 - ($cf1 * $cf2);
                        $cfEnd = number_format($cfEnd, 3, '.', ','); 
                        $combination[] = [
                            "formula" => "$cf1  +  $cf2 - ($cf1 * $cf2) = $cfEnd",
                            "cf" => $cfEnd
                        ];
                    }
                }
            }
            $type["combination"] = $combination;
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