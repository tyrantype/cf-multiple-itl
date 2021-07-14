<link rel="stylesheet" href="../assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="../assets/vendors/toastify/toastify.css">
<link rel="stylesheet" href="../assets/vendors/bootstrap-tagsinput/bootstrap-tagsinput.css">

<div class="page-heading">
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Tipe Minat Bakat</h3>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header float-start float-lg-end'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href=".">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tipe Minat Bakat</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div class="page-content">
    <div class="card">
        <div class="card-header">
            <button class="btn btn-light-primary" id="addTypeButton">Tambah data</button>
        </div>
        <div class="card-body">
            <table class='table table-hover' id="typesTable">
            </table>
        </div>
    </div>
</div>

<!-- Modal Tambah Data -->
<div class="modal fade" id="addTypeModal">
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
                            <form class="form form-vertical" id="addTypeForm">
                                <div class="form-body">
                                    <div class="form-group mb-2">
                                        <label for="name">Nama Tipe</label>
                                        <input type="text" class="form-control" name="name" id="name" placeholder="Nama Tipe" required>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="detail">Keterangan</label>
                                        <textarea class="form-control" id="detail" name="detail" placeholder="Keterangan"></textarea>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="advice">Saran</label>
                                        <textarea class="form-control" id="advice" name="advice" placeholder="Saran"></textarea>
                                    </div>

                                    <div class="form-group mb-2">
                                        <label for="advice">Bidang Pekerjaan Terkait</label>
                                        <input type="text" class="form-control tags-input" name="fields" data-role="tagsinput" value=""  required>
                                    </div>

                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
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

<script src="../assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="../assets/vendors/sweetalert2/sweetalert2.all.min.js"></script>
<script src="../assets/vendors/toastify/toastify.js"></script>
<script src="../assets/vendors/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>