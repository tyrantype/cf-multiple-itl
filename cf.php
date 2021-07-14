<?php
// // // 
// // $json = '{
// //     "id": "user1",
//     "name": "John Doe",
//     "interests": [
//         {
//             "id": "q1",
//             "indicator": "Saya suka merangkai puzzle atau lego",
//             "mb": 0.4,
//             "md": 0.7
//         },
//         {
//             "id": "q2",
//             "indicator": "Saya suka aktifitas fotografi",
//             "mb": 0.2,
//             "md": 0.4
//         },
//         {
//             "id": "q3",
//             "indicator": "Saya suka menggambar atau melukis",
//             "mb": 0.8,
//             "md": 0.3
//         },
//         {
//             "id": "q4",
//             "indicator": "Saya suka belajar dengan mengamati orang sekitar mengerjakan sesuatu",
//             "mb": 0.6,
//             "md": 0.6
//         },
//         {
//             "id": "q5",
//             "indicator": "Saya lebih cepat memahami sesuatu dalam bentuk gambar, grafik atau ilustrasi",
//             "mb": 0.3,
//             "md": 0.5
//         }
//     ]
// }';


// $a = json_decode('[
//     {
//         "id": "I0006",
//         "value": 0.4
//     },
//     {
//         "id": "I0002",
//         "value": 0.8
//     },
//     {
//         "id": "I0007",
//         "value": 0.2
//     },
//     {
//         "id": "I0003",
//         "value": 0.6
//     }
// ]');
// // $string = "";
// // for ($i = 0; $i < count($a); $i++) {
// //     $string .= "'" . $a[$i]->id . "'";
// //     if ($i < count($a) - 1) {
// //         $string .= ",";
// //     }
// // }

// // echo ($string);

// $a = [];
// $a[] = [
//     "id" => "a1",
//     "name" => "aldi"
// ];
// $a[] = [
//     "id" => "a2",
//     "name" => "kurni"
// ];
// $a[] = [
//     "id" => "a1",
//     "name" => "awan"
// ];
// $id = new stdClass();
// $id->a = "a1";
// $filter = array_filter(
//     $a,
//     function ($e) use ($id) {
//         return $e["id"] === $id;
//     }
// );

// var_dump($filter);
// $a[2]["name"] = "PAIJO";
// var_dump($filter);

// $args = array
// (
//     array( 'type' => 'AAA', 'label_id' => 'A1,35' ),
//     array( 'type' => 'AAA', 'label_id' => 'A2,34' ),
//     array( 'type' => 'BBB', 'label_id' => 'B1,29' ),
//     array( 'type' => 'CCC', 'label_id' => 'C1,20' ),
//     array( 'type' => 'CCC', 'label_id' => 'C2,19' ),
//     array( 'type' => 'CCC', 'label_id' => 'C3,18' )  
// );

// $tmp = array_unique($args);



// var_dump($tmp);


$var = [
    [
        "id" => 1,
        "name" => "nasgor",
        "categoryId" => "A",
        "categoryName" => "makanan",
    ],
    [
        "id" => 2,
        "name" => "sate",
        "categoryId" => "A",
        "categoryName" => "makanan",
    ],
    [
        "id" => 3,
        "name" => "jus",
        "categoryId" => "B",
        "categoryName" => "minuman",
    ],
    [
        "id" => 4,
        "name" => "susu",
        "categoryId" => "B",
        "categoryName" => "minuman",
    ],
    [
        "id" => 5,
        "name" => "teh",
        "categoryId" => "B",
        "categoryName" => "minuman",
    ]
];

$temp = [];
foreach ($var as $v) {
    $temp[$v["categoryId"]] = [
        "categoryName" => $v["categoryName"]
    ];
}

$category = [];
foreach ($temp as $key => $value) {
    $temp = [];
    $temp["id"] = $key;
    $temp["name"] = $value["categoryName"];
    $temp["produk"] = [];
    foreach ($var as $v) {
        if ($v["categoryId"] === $temp["id"]) {
            $temp["produk"][] = [
                "id" => $v["id"],
                "name" => $v["name"]
            ];
        }
    }
    $category[] = $temp;
}

echo json_encode($category);