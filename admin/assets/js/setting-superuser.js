FilePond.registerPlugin(
    FilePondPluginImagePreview,
    FilePondPluginImageExifOrientation,
    FilePondPluginFileValidateSize,
    FilePondPluginFileValidateType,
    FilePondPluginFileRename,
    FilePondPluginFileMetadata
);

const filepondApplicationForm = FilePond.create(document.querySelector('#filepondApplicationForm'), {
    acceptedFileTypes: ['image/*'],
    required: true,
    instantUpload: false,
    allowRevert: false,
    allowProcess: false,
    labelIdle: "Drag & Drop your files or Browse",
    maxParallelUploads: 1,
    server: {
        process: "../api/logo-upload.php"
    },
});
filepondApplicationForm.addFile("../assets/images/logo/logo.png")

fetch("../api/my-account")
    .then(response => response.json())
    .then(result => {
        const form = document.forms["userForm"]
        form["username"].value = result.data[0]["username"]
    })

document.forms["userForm"].addEventListener("submit", evt => {
    evt.preventDefault()

    const form = document.forms["userForm"]

    if (form["newPassword"].value !== form["newPassword2"].value) {
        showToast(400, "Password baru tidak sama")
        return
    }

    const formData = new FormData(form)
    let data = Object.fromEntries(formData)
    data = JSON.stringify(data)

    fetch("../api/my-account", {
        method: "PATCH",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            if (result.statusCode === 200) {
                Swal.fire({
                    text: "Berhasil mengubah data",
                    icon: 'success',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Ok'
                }).then((result) => {
                    window.location.reload();
                })
                form.reset()
            } else {
                showToast(result.statusCode, result.message);
            }
        })
        .catch(error => {
            console.error(error);
        })
})

fetch("../api/setting")
    .then(response => response.json())
    .then(result => {
        const form = document.forms["applicationForm"]
        form["schoolName"].value = result.data[0]["schoolName"];
        form["address"].value = result.data[0]["address"];
    })

document.forms["applicationForm"].addEventListener("submit", evt => {
    evt.preventDefault()

    const formData = new FormData(document.forms["applicationForm"]);
    let data = Object.fromEntries(formData);
    data = JSON.stringify(data);

    fetch("../api/setting", {
        method: "PUT",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            if (result.statusCode === 200) {
                filepondApplicationForm.processFiles()
                    .then(filepondResponse => {
                        Swal.fire({
                            text: "Berhasil update data",
                            icon: 'success',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'Ok'
                        }).then((result) => {
                            window.location.reload();
                        })
                    })
            }
        })
        .catch(error => {
            console.error(error);
        })
})