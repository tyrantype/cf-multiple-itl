<?php
session_start();

if (strpos($_SERVER["REQUEST_URI"], '?') !== false && $_SERVER['QUERY_STRING'] !== "") {
    $page = strtok(explode("?", $_SERVER["REQUEST_URI"])[1], '&');
    switch($page) {
        case "login":
            require_once "pages/login.php";
            die();
            break;
        case "register":
            require_once "pages/register.php";
            die();
            break;
    }
} else {
    $page = "homepage";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Pakar Identifikasi Minat dan Bakat</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/logo/favicon.ico">

    <script src="assets/vendors/jquery/jquery.min.js"></script>
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
                            <a href="."><img src="assets/images/logo/sistem-pakar.webp" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item  sidebar-item-homepage">
                            <a href="." class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Homepage</span>
                            </a>
                        </li>

                        <li class="sidebar-item sidebar-item-tipe-minat-bakat ">
                            <a href="?tipe-minat-bakat" class='sidebar-link'>
                                <i class="bi bi-bookmark-fill"></i>
                                <span>Tipe Minat Bakat</span>
                            </a>
                        </li>

                        <li class="sidebar-item  sidebar-item-rules">
                            <a href="?rules" class='sidebar-link'>
                                <i class="bi bi-rulers"></i>
                                <span>Rules</span>
                            </a>
                        </li>

                        <li class="sidebar-item  sidebar-item-identifikasi-minat-bakat">
                            <a href="?demo" class='sidebar-link'>
                                <i class="bi bi-upc-scan"></i>
                                <span>Demo</span>
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
                            <a href="?login"><h5>Login</h5></a>
                        </div>
                    </div>
                </nav>
            </header>

            <?php
            $pageFound = true;
            switch ($page) {
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
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendors/dayjs/dayjs.min.js"></script>
    <script src="assets/vendors/dayjs/plugin/relativeTime.js"></script>

    <script src="assets/js/main.js"></script>

    <?=
    $pageFound ? "<script src='assets/js/pages/$script'></script>" : ""
    ?>
</body>

</html>