<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/pages/auth.css">
</head>

<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo">
                        <a href="."><img src="assets/images/logo/sistem-pakar.webp" alt="Logo"></a>
                    </div>
                    <h1 class="auth-title">Log in.</h1>

                    <form id="login">
                        <input type="hidden" name="session" value="<?= session_id() ?>">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="username" placeholder="NIS">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" name="password" placeholder="Password">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Masuk</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Tidak mempunyai akun? <a href="?register"
                                class='font-bold'>Daftar</a>.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>
    </div>
    <script>
        const form = document.forms["login"];

        form.addEventListener("submit", evt => {
            evt.preventDefault();

            const formData = new FormData(form);
            const data = JSON.stringify(Object.fromEntries(formData))

            fetch("api/login.php", {
                method: "POST",
                headers: {
                    "ContentType": "application/json;charset=utf-8"
                },
                body: data
            })
                .then(response => response.text())
                .then(result => {
                    alert(result)
                });
        });
    </script>
</body>

</html>