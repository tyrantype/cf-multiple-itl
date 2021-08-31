<?php

$target_dir = "../assets/images/logo/";
$filename = "logo.png";
$imageFileType = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
$target_file = $target_dir . $filename;
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
        $response = new stdClass();
        $response->statusCode = 200;
        $response->message = "Berhasil upload logo";
        http_response_code(200);

        return $response;
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
