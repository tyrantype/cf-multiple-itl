<link rel="stylesheet" href="../assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="../assets/vendors/toastify/toastify.css">

<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Pengguna</h3>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header float-start float-lg-end'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=".">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Pengguna</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="page-content">
    <div class="card">
        <div class="card-header">
            <button class="btn btn-light-primary" id="addUserButton">Tambah data</button>
        </div>
        <div class="card-body">
            <table class='table table-hover' id="usersTable">
            </table>
        </div>
    </div>
</div>

<!-- Modal Tambah Data -->
<div class="modal fade" id="addUserModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Tambah Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-0">
                <div class="card mb-0">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-vertical" id="addUserForm">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Nama Lengkap</label>
                                                <div class="position-relative">
                                                    <input type="text" class="form-control" name="fullName" placeholder="Nama Lengkap" required>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-person"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Username</label>
                                                <div class="position-relative">
                                                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-credit-card-2-front"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Password</label>
                                                <div class="position-relative">
                                                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-key"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Hak Akses</label>
                                                <div class="position-relative">
                                                    <select class="form-control" name="privilege" required>
                                                        <option value="" disabled selected hidden>Hak Akses</option>
                                                        <option value="user">User</option>
                                                        <option value="admin">Admin</option>
                                                    </select>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-shield-lock"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12 mb-4">
                                            <p class="mb-1">Avatar</p>
                                            <label>
                                                <input type="radio" name="avatarId" value="1" required selected>
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/1.jpg" alt="avatar1">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="2">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/2.jpg" alt="avatar2">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="3">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/3.jpg" alt="avatar3">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="4">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/4.jpg" alt="avatar4">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="5">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/5.jpg" alt="avatar5">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="6">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/6.jpg" alt="avatar6">
                                                </div>
                                            </label>
                                        </div>

                                        <div class="col-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                            <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Edit Data -->
<div class="modal fade" id="editUserModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Ubah Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-0">
                <div class="card mb-0">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-vertical" id="editUserForm">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Nama Lengkap</label>
                                                <div class="position-relative">
                                                    <input type="text" class="form-control" name="fullName" placeholder="Nama Lengkap" required>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-person"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <input type="hidden" name="oldUsername" disabled>

                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Username</label>
                                                <div class="position-relative">
                                                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-credit-card-2-front"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group has-icon-left">
                                                <label>Hak Akses</label>
                                                <div class="position-relative">
                                                    <select class="form-control" name="privilege" required>
                                                        <option value="" disabled selected hidden>Hak Akses</option>
                                                        <option>User</option>
                                                        <option>Admin</option>
                                                    </select>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-shield-lock"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12 mb-4">
                                            <p class="mb-1">Avatar</p>
                                            <label>
                                                <input type="radio" name="avatarId" value="1" required selected>
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/1.jpg" alt="avatar1">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="2">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/2.jpg" alt="avatar2">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="3">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/3.jpg" alt="avatar3">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="4">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/4.jpg" alt="avatar4">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="5">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/5.jpg" alt="avatar5">
                                                </div>
                                            </label>
                                            <label>
                                                <input type="radio" name="avatarId" value="6">
                                                <div class="avatar avatar-lg me-2">
                                                    <img src="../assets/images/faces/6.jpg" alt="avatar6">
                                                </div>
                                            </label>
                                        </div>

                                        <div class="col-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                            <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal History -->
<div class="modal fade" id="historyModal" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Riwayat Identifikasi Aldi Kurniawan</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-0">
                <div class="card mb-0">
                    <div class="card-content">
                        <div class="card-body">
                            <table class='table table-hover' id="table1">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Waktu</th>
                                        <th>Tipe Minat Bakat</th>
                                        <th>Nilai CF</th>
                                        <th class="col-3">Opsi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>5 min ago</td>
                                        <td>Kinestetik</td>
                                        <td>0.352</td>
                                        <td class="d-flex flex-row">
                                            <button class="btn btn-light-primary me-2" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-dismiss="modal">Detail</button>
                                            <button class="btn btn-light-danger" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-dismiss="modal">Hapus</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>23 min ago</td>
                                        <td>Kinestetik</td>
                                        <td>0.585</td>
                                        <td class="d-flex flex-row">
                                            <button class="btn btn-light-primary me-2" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-dismiss="modal">Detail</button>
                                            <button class="btn btn-light-danger" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-dismiss="modal">Hapus</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>55 min ago</td>
                                        <td>Kinestetik</td>
                                        <td>0.453</td>
                                        <td class="d-flex flex-row">
                                            <button class="btn btn-light-primary me-2" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-dismiss="modal">Detail</button>
                                            <button class="btn btn-light-danger" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-dismiss="modal">Hapus</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal  Detail -->
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
                                        <li>Intra-personal (0.361%)</li>
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
                                        <td>Saya suka mata pelajaran olahraga</td>
                                        <td>Kinestetik</td>
                                        <td>0.2</td>
                                        <td>0.4</td>
                                    </tr>
                                    <tr>
                                        <td>Saya lebih suka bergerak ketika mempelajari sesuatu</td>
                                        <td>Kinestetik</td>
                                        <td>0.2</td>
                                        <td>0.4</td>
                                    </tr>
                                    <tr>
                                        <td>Saya suka bermain sandiwara (acting) atau menari</td>
                                        <td>Kinestetik</td>
                                        <td>0.2</td>
                                        <td>0.4</td>
                                    </tr>
                                    <tr>
                                        <td>Saya suka melakukan aktivitas di alam terbuka</td>
                                        <td>Kinestetik</td>
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
                                        Kinestetik
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
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#historyModal" data-bs-dismiss="modal">Kembali</button>
                </div> -->
            </div>
        </div>
    </div>
</div>

<script src="../assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="../assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../assets/vendors/toastify/toastify.js"></script>