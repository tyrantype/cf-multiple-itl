<link rel="stylesheet" href="../assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="../assets/vendors/toastify/toastify.css">
<link rel="stylesheet" href="../assets/css/pages/dashboard.css">

<div class="page-content">
    <section class="row">
        <div class="col-12 col-lg-9">
            <div class="row">
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon purple">
                                        <i class="iconly-boldProfile"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Pengguna</h6>
                                    <h6 class="font-extrabold mb-0">5</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon green">
                                        <i class="iconly-boldBookmark"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Minat Bakat</h6>
                                    <h6 class="font-extrabold mb-0">15</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon blue">
                                        <i class="iconly-boldWork"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Bidang Pekerjaan</h6>
                                    <h6 class="font-extrabold mb-0">25</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="stats-icon red">
                                        <i class="iconly-boldChart"></i>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <h6 class="text-muted font-semibold">Rules</h6>
                                    <h6 class="font-extrabold mb-0">15</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Total Tes Identifikasi Tipe Minat Bakat</h4>
                        </div>
                        <div class="card-body">
                            <div id="chart-profile-visit"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-xl-12">
                    <div class="card" id="card-history">
                        <div class="card-header pb-0">
                            <h4>Riwayat Identifikasi Terakhir</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg" id="historyTable">
                                </table>

                                <!-- Modal detail -->
                                <div class="modal fade" id="detailModal" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">Detail Identifkasi</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body mb-0">

                                                <div class="card mb-0">
                                                    <div class="card-body">
                                                        <div id="carouselDetail" class="carousel slide" data-bs-ride="carousel">
                                                            <div class="carousel-indicators">
                                                                <button type="button" data-bs-target="#carouselDetail" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                                <button type="button" data-bs-target="#carouselDetail" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                                <button type="button" data-bs-target="#carouselDetail" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                                            </div>
                                                            <div class="carousel-inner">
                                                                <div class="carousel-item active" data-bs-interval="2000" data-bs-pause="false">
                                                                    <img src="../assets/images/illustrations/kinesketik-3.svg" class="d-block w-100" alt="...">
                                                                </div>
                                                                <div class="carousel-item" data-bs-interval="2000" data-bs-pause="false">
                                                                    <img src="../assets/images/illustrations/kinesketik-1.svg" class="d-block w-100" alt="...">
                                                                </div>
                                                                <div class="carousel-item" data-bs-interval="2000" data-bs-pause="false">
                                                                    <img src="../assets/images/illustrations/kinesketik-2.svg" class="d-block w-100" alt="...">
                                                                </div>
                                                            </div>
                                                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselDetail" data-bs-slide="prev">
                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                <span class="visually-hidden">Previous</span>
                                                            </button>
                                                            <button class="carousel-control-next" type="button" data-bs-target="#carouselDetail" data-bs-slide="next">
                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                <span class="visually-hidden">Next</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <ul class="nav nav-pills mb-4" id="pills-tab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Info</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Perhitungan</button>
                                                    </li>
                                                </ul>

                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                                        <div class="card mb-0">
                                                            <div class="card-content">
                                                                <div class="card-body p-0">
                                                                    <h4 class="card-title">Kinesketik (0.532%)</h4>
                                                                    <h6 class="card-subtitle">Atlet Olahraga, Aktor, Model, Penari</h6>
                                                                </div>

                                                                <div class="card-body px-0">
                                                                    <p class="card-text">
                                                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda mollitia
                                                                        officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake sweet roll
                                                                        jujubes tiramisu.
                                                                    </p>
                                                                </div>

                                                                <div class="card-body p-0">
                                                                    <h6 class="card-subtitle">Kemungkinan lain</h6>
                                                                    <ul>
                                                                        <li>Linguistik (0.361%)</li>
                                                                        <li>Matematika Logika (0.253%)</li>
                                                                        <li>Musikal (0.165%)</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                                        <div class="card mb-0">
                                                            <div class="card-header bg-light py-3">
                                                                Rule yang dipilih
                                                            </div>
                                                            <div class="card-body">
                                                                <table class='table'>
                                                                    <tr>
                                                                        <th>Minat Bakat</th>
                                                                        <th>Tipe</th>
                                                                        <th>MB</th>
                                                                        <th>MD</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Suka membaca buku</td>
                                                                        <td>Linguistik</td>
                                                                        <td>0.2</td>
                                                                        <td>0.4</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Suka membuat atau mengarang cerita</td>
                                                                        <td>Linguistik</td>
                                                                        <td>0.2</td>
                                                                        <td>0.4</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Saya menyukai flora dan fauna serta alam semesta</td>
                                                                        <td>Linguistik</td>
                                                                        <td>0.2</td>
                                                                        <td>0.4</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Saya suka tentang alam</td>
                                                                        <td>Linguistik</td>
                                                                        <td>0.2</td>
                                                                        <td>0.4</td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>

                                                        <div class="card">
                                                            <div class="card-header bg-light py-3">
                                                                Perhitungan Certainty Factor
                                                            </div>
                                                            <div class="card-body">
                                                                <ul>
                                                                    <li>
                                                                        Linguistik
                                                                        <ul>
                                                                            <li>CF 1: 0.2 x 0.2 = <strong>0.2</strong></li>
                                                                            <li>CF 2: 0.2 x 0.2 = <strong>0.4</strong></li>
                                                                            <li>CF 3: 0.2 x 0.2 = <strong>0.6</strong></li>
                                                                            <li>CF Kombinasi 1: 0.2 x 0.2 = <strong>0.6</strong></li>
                                                                            <li>CF Kombinasi 2: 0.2 x 0.2 = <strong>0.6</strong></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        Matematika-Logika
                                                                        <ul>
                                                                            <li>CF 1:0.2 x 0.2 = <strong>0.2</strong></li>
                                                                            <li>CF 2: 0.2 x 0.2 = <strong>0.6</strong></li>
                                                                            <li>CF Kombinasi 2: 0.2 x 0.2 = <strong>0.6</strong></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li>
                                                                        Musikal
                                                                        <ul>
                                                                            <li>CF 1: 0.2 x 0.2 = <strong>0.6</strong></li>
                                                                        </ul>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End modal detail -->

                                <!-- <table class="table table-hover table-lg" id="historyTable">
                                    <thead>
                                        <tr>
                                            <th>Waktu</th>
                                            <th>Nama</th>
                                            <th>Tipe Minat Bakat</th>
                                            <th>Nilai CF</th>
                                            <th>Opsi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="col-2">
                                                <p>2 min ago</p>
                                            </td>
                                            <td class="col-4">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar">
                                                        <img src="../assets/images/faces/5.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Cantik</p>
                                                </div>
                                            </td>
                                            <td class="col-3">
                                                <p>Kinesketik</p>
                                            </td>

                                            <td class="col-3">
                                                <p class=" mb-0">0.553</p>
                                            </td>
                                            <td class="col-auto">
                                                <button class="popover-option btn btn-light-primary font-bold" data-bs-username='${row.children.item(2).innerText}'>...</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <p>1 hour ago</p>
                                            </td>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar">
                                                        <img src="../assets/images/faces/2.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                                </div>
                                            </td>
                                            <td class="col-3">
                                                <p>Linguistik</p>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">0.617</p>
                                            </td>
                                            <td>
                                                <button class="popover-option btn btn-light-primary font-bold" data-bs-username='${row.children.item(2).innerText}'>...</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <p>3 hour ago</p>
                                            </td>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar">
                                                        <img src="../assets/images/faces/0.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Anonim</p>
                                                </div>
                                            </td>
                                            <td class="col-3">
                                                <p>Linguistik</p>
                                            </td>

                                            <td class="col-auto">
                                                <p class=" mb-0">0.217</p>
                                            </td>
                                            <td>
                                                <button class="popover-option btn btn-light-primary font-bold" data-bs-username='${row.children.item(2).innerText}'>...</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table> -->
                                <div class="d-flex justify-content-center mb-2  ">
                                    <button class="btn btn-light-primary font-bold py-2 px-4">View more</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-3">
            <div class="card">
                <div class="card-body py-4 px-4">
                    <div class="d-flex align-items-center">
                        <div class="avatar avatar-xl">
                            <img src="../assets/images/logo/sd-2.webp" alt="Face 1">
                        </div>
                        <div class="ms-3 name">
                            <h5 class="font-bold">SDN Kwaron I</h5>
                            <h6 class="text-muted mb-0">Jombang</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>Umpan Balik</h4>
                </div>
                <div class="card-content pb-4">
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="../assets/images/faces/4.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">Aldi Kurniawan</h5>
                            <h6 class="text-muted mb-0">@aldikurw</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="../assets/images/faces/5.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">Nur Kholis</h5>
                            <h6 class="text-muted mb-0">@nurkholis</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="../assets/images/faces/1.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">Slamet Wirawan</h5>
                            <h6 class="text-muted mb-0">@wirawan</h6>
                        </div>
                    </div>
                    <div class="px-4">
                        <button class='btn btn-block py-2 btn-light-primary font-bold mt-3'>View more</button>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>Riwayat Identifikasi</h4>
                </div>
                <div class="card-body">
                    <div id="chart-visitors-profile"></div>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="../assets/vendors/apexcharts/apexcharts.js"></script>
<script src="../assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="../assets/vendors/toastify/toastify.js"></script>