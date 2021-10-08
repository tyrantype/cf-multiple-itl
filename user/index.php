<?php
session_start();

require_once "../api/classes/Users.php";
if (isset($_SESSION["username"])) {
    if ($_SESSION["username"] !== $superuser->username) {
        $response = Users::get($_SESSION["username"]);
        if ($response->statusCode === 200) {
            if ($response->data[0]["Hak Akses"] !== "User") {
                header("Location: ..");
                die();
            };
        }
    } else {
        header("Location: ..");
        die();
    }
} else {
    header("Location: ..");
    die();
}

if (strpos($_SERVER["REQUEST_URI"], '?') !== false && $_SERVER['QUERY_STRING'] !== "") {
    $page = strtok(explode("?", $_SERVER["REQUEST_URI"])[1], '&');
} else {
    $page = "dashboard";
}

$account = new stdClass();
$account = Users::get($_SESSION["username"]);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Pakar Identifikasi Minat dan Bakat</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/bootstrap.css">

    <link rel="stylesheet" href="../assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="../assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="../assets/css/app.css">
    <link rel="shortcut icon" href="../assets/images/logo/favicon.ico">

    <script src="../assets/vendors/jquery/jquery.min.js"></script>
    <script>
        const username = <?= $_SESSION["username"]  ?>
    </script>
</head>

<body class="overflow-hidden">
    <div id="app">
        <div class="loading-overlay card d-flex align-items-center justify-content-center">
            <div class=" justfiy-content-center">
                <div class="spinner-grow text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>

        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="../home"><img src="../assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item  sidebar-item-home">
                            <a href="../home" class='sidebar-link'>
                                <i class="bi bi-house-fill"></i>
                                <span>Home</span>
                            </a>
                        </li>

                        <li class="sidebar-item  sidebar-item-dashboard">
                            <a href="." class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item sidebar-item-tipe-minat-bakat ">
                            <a href="?tipe-minat-bakat" class='sidebar-link'>
                                <i class="bi bi-bookmark-fill"></i>
                                <span>Tipe Minat Bakat</span>
                            </a>
                        </li>

                        <!-- <li class="sidebar-item  sidebar-item-rules">
                            <a href="?rules" class='sidebar-link'>
                                <i class="bi bi-rulers"></i>
                                <span>Basis Pakar</span>
                            </a>
                        </li> -->

                        <li class="sidebar-item  sidebar-item-demo">
                            <a href="?demo" class='sidebar-link'>
                                <i class="bi bi-upc-scan"></i>
                                <span>Tes Minat Bakat</span>
                            </a>
                        </li>

                        <li class="sidebar-item  sidebar-item-history">
                            <a href="?history" class='sidebar-link'>
                                <i class="bi bi-clock-history"></i>
                                <span>Riwayat</span>
                            </a>
                        </li>

                        <li class="sidebar-item  sidebar-item-feedback ">
                            <a href="?feedback" class='sidebar-link'>
                                <i class="bi bi-chat-left-text-fill"></i>
                                <span>Feedback</span>
                            </a>
                        </li>

                        <li class="sidebar-item sidebar-item-setting ">
                            <a href="?setting" class='sidebar-link'>
                                <i class="bi bi-gear-fill"></i>
                                <span>Pengaturan</span>
                            </a>
                        </li>

                        <li class="sidebar-item sidebar-item-logout ">
                            <a href="?logout" class='sidebar-link'>
                                <i class="bi bi-box-arrow-left"></i>
                                <span>Keluar</span>
                            </a>
                        </li>

                        <li class="sidebar-item sidebar-item-<?= $page ?> d-none">
                        </li>

                        <script>
                            const page = "<?= $page ?>";
                            document.querySelector(`li.sidebar-item-${page}`)?.classList.add("active");
                        </script>
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        <div id="main">
            <header class="mb-3">
                <nav class="navbar navbar-expand-lg navbar-light p-0">
                    <div class="container-fluid">
                        <a href="#" class="burger-btn d-block ">
                            <i class="bi bi-justify fs-3"></i>
                        </a>

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            </ul>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="user-menu d-flex">
                                        <div class="user-name text-end me-3">
                                            <h6 class="mb-0 text-gray-600"><?= $account->data[0]["Nama Lengkap"] ?></h6>
                                            <p class="mb-0 text-sm text-gray-600"><?= $account->data[0]["Hak Akses"] ?></p>
                                        </div>
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                <img src="../assets/images/faces/<?= $account->data[0]["avatarId"] ?>.jpg">
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>

            <?php
            echo "
                <script>
                    const signed = true;
                </script>
            ";
            $pageFound = true;
            switch ($page) {
                case "dashboard":
                    include_once "pages/dashboard.html";
                    $script = "dashboard.js";
                    break;
                case "tipe-minat-bakat":
                    include_once "pages/types.html";
                    $script = "types.js";
                    break;
                case "rules":
                    include_once "pages/interests.html";
                    $script = "interests.js";
                    break;
                case "demo":
                    include_once "pages/demo.html";
                    $script = "demo.js";
                    break;
                case "history":
                    include_once "pages/history.html";
                    $script = "history.js";
                    break;
                case "feedback":
                    include_once "pages/feedback.html";
                    $script = "feedback.js";
                    break;
                case "setting":
                    include_once "pages/setting.html";
                    $script = "setting.js";
                    break;
                case "logout":
                    session_destroy();
                    $script = "logout.js";
                    break;
                default:
                    include_once "pages/404.html";
                    $pageFound = false;
            }
            ?>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2021 &copy; Sistem Pakar Identifikasi Minat dan Bakat</p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendors/dayjs/dayjs.min.js"></script>
    <script src="../assets/vendors/dayjs/plugin/relativeTime.js"></script>
    <script src="../assets/vendors/dayjs/plugin/utc.js"></script>
    <script src="../assets/vendors/dayjs/plugin/timezone.js"></script>

    <script src="../assets/js/main.js"></script>

    <?=
    $pageFound ? "<script src='assets/js/$script'></script>" : ""
    ?>

</body>

</html>