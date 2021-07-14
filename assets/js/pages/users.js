// Add simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let usersDataTable;
refreshUsersDataTable();

function refreshUsersDataTable() {
    fetch("../api/users")
        .then(response => response.json())
        .then(result => {
            let usersTable = document.querySelector('#usersTable');
            usersTable.innerHTML = "";

            if (typeof usersDataTable !== "undefined") {
                usersDataTable.destroy();
                usersDataTable = undefined;
            }
            let obj = {
                headings: ["No", "id", "Nama Lengkap", "Username", "Terakhir Login", "Hak Akses", "avatarId", "Opsi"],
                data: []
            };

            for (let i = 0; i < result.data.length; i++) {
                obj.data[i] = [i + 1];
                for (let p in result.data[i]) {
                    if (result.data[i].hasOwnProperty(p)) {
                        obj.data[i].push(result.data[i][p]);
                    }
                }
                obj.data[i].push("");
            }

            for (data of obj.data) {
                if (data[4] !== null) {
                    data[4] = dayjs(data[4]).fromNow();
                } else {
                    data[4] = "---";
                }
            }

            usersDataTable = new simpleDatatables.DataTable(usersTable, {
                columns: [
                    {
                        select: 2,
                        render: function (data, cell, row) {
                            return `
                            <div class="avatar avatar-sm bg-warning me-2">
                                <img src="../assets/images/faces/${row.children.item(6).innerText}.jpg">
                            </div>
                            <span>${data}</span>
                            `;
                        }
                    },
                    { select: [1, 6], hidden: true },
                    {
                        select: 7,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <button class="popover-option btn btn-light-primary font-bold"  data-bs-username='${row.children.item(3).innerText}' data-bs-fullname='${row.children.item(2).querySelector('span').innerText}'>...</button>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            usersDataTable.on('datatable.init', initOptionButton);
            usersDataTable.on('datatable.update', initOptionButton);
        });
}

function initOptionButton() {
    initPopoverEvent();
    initHistoryModalEvent();
}

function initPopoverEvent() {
    let popoverTriggerList = [].slice.call(document.querySelectorAll('.popover-option'))
    let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl, {
            trigger: "keydown",
            placement: "bottom",
            html: true,
            sanitize: false,
            content: `
                <div class="d-flex flex-column">
                    <button class="btn btn-light-warning d-grid place-items-center m-1 pt-2 pb-2" data-bs-toggle="modal" data-bs-target="#editUserModal" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}" data-bs-fullname="${popoverTriggerEl.getAttribute('data-bs-fullname')}">Ubah Data</button>
                    <button id="btnResetPasswordUser" class="btn btn-light-warning d-grid place-items-center m-1 pt-2 pb-2" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}" data-bs-fullname="${popoverTriggerEl.getAttribute('data-bs-fullname')}">Reset Password</button>
                    <button id="btnRemoveUser" class="btn btn-light-danger d-grid place-items-center m-1 pt-2 pb-2" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}" data-bs-fullname="${popoverTriggerEl.getAttribute('data-bs-fullname')}">Hapus</i></button>
                    <button class="btn btn-light-secondary d-grid place-items-center m-1 pt-2 pb-2" data-bs-toggle="modal" data-bs-target="#historyModal" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}">Riwayat</button>
                </div>
            `
        })
    });
    popoverTriggerList.forEach(el => {
        el.addEventListener("click", evt => {
            initResetPassswordUserEvent();
            initDeleteUserEvent();
        })
    });
}

function initResetPassswordUserEvent() {
    const btnResetPasswordUser = document.querySelector('#btnResetPasswordUser');
    const username = document.querySelector('#btnResetPasswordUser').getAttribute("data-bs-username");
    btnResetPasswordUser.addEventListener('click', evt => {
        fetch(`../api/password-reset/${username}`, {
            method: "PATCH",
            headers: {
                "ContentType": "application/json",
            }
        })
            .then(response => response.json())
            .then(result => {
                if (result.statusCode === 200) {
                    Swal.fire({
                        title: "Password baru",
                        text: "Click to copy", 
                        html: `
                            <div class="d-flex flex-column" id="newPasswordContainer">
                                <p>Click to copy</p>
                                <input type="text" id="newPassword" class="form-control text-center font-bold" value="${result.data[0].newPassword}" readonly>
                            </div>
                        `,  
                        confirmButtonText: "OK", 
                    });

                    const newPassword = document.querySelector('#newPassword');
                    var popover = new bootstrap.Popover(newPassword, {
                        trigger: "focus",
                        placement: "top",
                        content: "Copied"
                    })
                    newPassword.addEventListener("click", evt => {
                        newPassword.select();
                        document.execCommand("copy");
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        text: result.message,
                      })
                }
            })
            .catch(error => console.error(error))
    });
}

function initDeleteUserEvent() {
    const btnRemoveUser = document.querySelector('#btnRemoveUser');
    btnRemoveUser.addEventListener('click', evt => {
        const fullname = evt.currentTarget.getAttribute("data-bs-fullname");
        const username = evt.currentTarget.getAttribute("data-bs-username");
        Swal.fire({
            title: 'Hapus user ' + fullname,
            showCancelButton: true,
            confirmButtonText: 'Hapus',
            cancelButtonText: 'Batal',
            showLoaderOnConfirm: true,
            preConfirm: (login) => {
                return fetch(`../api/user/${username}`, {
                    method: "DELETE",
                    headers: {
                        "ContentType": "application/json;charset=utf-8"
                    }
                })
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .then(result => {
                        showToast(result.statusCode, result.message);
                        refreshUsersDataTable();
                    })
                    .catch(error => {
                        console.error(error);
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        })
    });
}

function initHistoryModalEvent() {
    let editUserModal = document.getElementById('historyModal')
    editUserModal.addEventListener('show.bs.modal', function (event) {
        let button = event.relatedTarget
        let username = button.getAttribute('data-bs-username')
        let modalTitle = editUserModal.querySelector('.modal-title')

        modalTitle.textContent = 'Riwayat identifikasi ' + username
    })
}
// End simple data table ---------------------------------------------------------------------------


// Add user +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let addUserModal = new bootstrap.Modal(document.querySelector('#addUserModal'), {
    backdrop: "static",
    keyboard: false
});
let addUserForm = document.forms["addUserForm"];

document.querySelector("#addUserButton").addEventListener("click", evt => {
    addUserModal.show();
});

document.querySelector("#addUserModal").addEventListener("hide.bs.modal", evt => {
    addUserForm.reset();
});

addUserForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(addUserForm);
    const data = JSON.stringify(Object.fromEntries(formData))

    fetch("../api/users", {
        method: "POST",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            showToast(result.statusCode, result.message);
            if (result.statusCode === 200) {
                refreshUsersDataTable();
                addUserForm.reset();
                addUserModal.hide();
            }
        })
        .catch(error => {
            console.error(error);
        })

});
// End add user ---------------------------------------------------------------------------

// Edit user +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let editUserModal = new bootstrap.Modal(document.querySelector('#editUserModal'), {
    backdrop: "static",
    keyboard: false
});
let editUserForm = document.forms["editUserForm"];

document.querySelector("#editUserModal").addEventListener("show.bs.modal", evt => {
    const button = evt.relatedTarget
    const fullname = button.getAttribute('data-bs-fullname')
    const username = button.getAttribute('data-bs-username')
    const modalTitle = editUserModal._element.querySelector('.modal-title')

    modalTitle.textContent = 'Ubah data ' + fullname

    fetch("../api/user/" + username, {
        headers: {
            "ContentType": "application/json;charset=utf-8;"
        }
    })
        .then(response => response.json())
        .then(result => {
            const editForm = document.forms["editUserForm"]
            editForm["fullName"].value = result.data[0]["Nama Lengkap"]
            editForm["oldUsername"].value = result.data[0]["Username"]
            editForm["username"].value = result.data[0]["Username"]
            editForm["privilege"].value = result.data[0]["Hak Akses"]
            editForm["avatarId"].value = result.data[0]["avatarId"]
        })

});

document.querySelector("#editUserModal").addEventListener("hide.bs.modal", evt => {
    editUserForm.reset();
});

editUserForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(editUserForm);
    const data = JSON.stringify(Object.fromEntries(formData));
    const username = editUserForm["oldUsername"].value;

    fetch("../api/user/" + username, {
        method: "PATCH",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            showToast(result.statusCode, result.message);
            if (result.statusCode === 200) {
                refreshUsersDataTable();
                editUserForm.reset();
                editUserModal.hide();
            }
        })
        .catch(error => {
            console.error(error);
        })
});

// End edit user ---------------------------------------------------------------------------