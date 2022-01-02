// Add simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let usersDataTable;
let approvalDataTable;
refreshUsersDataTable();
refreshApprovalDataTable();

function refreshUsersDataTable() {
    fetch("../api/users?approval=Ya")
        .then(response => response.json())
        .then(result => {
            let usersTable = document.querySelector('#usersTable');
            usersTable.innerHTML = "";

            if (typeof usersDataTable !== "undefined") {
                usersDataTable.destroy();
                usersDataTable = undefined;
            }
            let obj = {
                headings: ["No", "id", "Nama Lengkap", "NIS", "Jenis Kelamin", "Tanggal Lahir", "Alamat", "Terakhir Login", "Hak Akses", "avatarId", "Terverifikasi", "Opsi"],
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
                if (data[7] !== null) {
                    data[7] = dayjs(data[7]).fromNow();
                } else {
                    data[7] = "-";
                }
            }

            usersDataTable = new simpleDatatables.DataTable(usersTable, {
                columns: [
                    {
                        select: 2,
                        render: function (data, cell, row) {
                            return `
                            <div class="avatar avatar-sm me-2">
                                <img src="../assets/images/faces/${row.children.item(9).innerText}.jpg">
                                <span class="ms-2">${data}</span>
                            </div>
                            `;
                        }
                    },
                    { select: [1, 9, 10], hidden: true },
                    {
                        select: 11,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <div class="d-flex">
                                        <button class="btn btn-light-info d-grid place-items-center me-1 historyButton" data-bs-username="${row.children.item(3).innerText}">Riwayat</button>
                                        <button class="popover-option btn btn-light-primary font-bold"  data-bs-username='${row.children.item(3).innerText}' data-bs-fullname='${row.children.item(2).querySelector('span').innerText}'>...</button>
                                    </div>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            usersDataTable.on('datatable.init', initOptionButton);
            usersDataTable.on('datatable.update', initOptionButton);
            usersDataTable.on('datatable.page', initOptionButton);
        });
}

function refreshApprovalDataTable() {
    fetch("../api/users?approval=Tidak")
        .then(response => response.json())
        .then(result => {
            let approvalTable = document.querySelector('#approvalTable');
            approvalTable.innerHTML = "";

            if (typeof approvalDataTable !== "undefined") {
                approvalDataTable.destroy();
                approvalDataTable = undefined;
            }
            let obj = {
                headings: ["No", "id", "Nama Lengkap", "NIS", "Jenis Kelamin", "Tanggal Lahir", "Alamat", "Terakhir Login", "Hak Akses", "avatarId", "Terverifikasi", "Opsi"],
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
                if (data[7] !== null) {
                    data[7] = dayjs(data[7]).fromNow();
                } else {
                    data[7] = "-";
                }
            }

            approvalDataTable = new simpleDatatables.DataTable(approvalTable, {
                columns: [
                    {
                        select: 2,
                        render: function (data, cell, row) {
                            return `
                            <div class="avatar avatar-sm me-2">
                                <img src="../assets/images/faces/${row.children.item(9).innerText}.jpg">
                                <span class="ms-2">${data}</span>
                            </div>
                            `;
                        }
                    },
                    { select: [1, 8, 7, 9, 10], hidden: true },
                    {
                        select: 11,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <div class="d-flex">
                                        <button class="btn btn-light-success d-grid place-items-center me-1 terimaButton" data-bs-username="${row.children.item(3).innerText}" data-bs-fullname="${row.children.item(2).innerText}">Terima</button>
                                        <button class="btn btn-light-danger d-grid place-items-center me-1 tolakButton" data-bs-username="${row.children.item(3).innerText}" data-bs-fullname="${row.children.item(2).innerText}">Tolak</button>
                                    </div>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            approvalDataTable.on('datatable.init', initApprovalButtons);
            approvalDataTable.on('datatable.update', initApprovalButtons);
            approvalDataTable.on('datatable.page', initApprovalButtons);
        });
}

function initApprovalButtons() {
    initTerimaButton();
    initTolakButton();
}

function initTerimaButton() {
    document.querySelectorAll(".terimaButton").forEach(e => {
        e.addEventListener("click", evt => {
            const fullname = evt.currentTarget.getAttribute("data-bs-fullname");
            const username = evt.currentTarget.getAttribute("data-bs-username");
            Swal.fire({
                title: `Yakin menerima ${fullname}`,
                showCancelButton: true,
                confirmButtonText: 'Ya ',
                cancelButtonText: 'Batal',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return fetch(`../api/terima-user.php?username=${username}`, {
                        method: "GET",
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
                        refreshApprovalDataTable();
                    })
                    .catch(error => {
                        console.error(error);
                    })
                },
                allowOutsideClick: () => !Swal.isLoading()
            })
        });
    });
}

function initTolakButton() {
    document.querySelectorAll(".tolakButton").forEach(e => {
        e.addEventListener("click", evt => {
            const fullname = evt.currentTarget.getAttribute("data-bs-fullname");
            const username = evt.currentTarget.getAttribute("data-bs-username");
            Swal.fire({
                title: 'Yakin menolak ' + fullname,
                showCancelButton: true,
                confirmButtonText: 'Ya ',
                cancelButtonText: 'Batal',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return fetch(`../api/tolak-user.php?username=${username}`, {
                        method: "GET",
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
                        refreshApprovalDataTable();
                    })
                    .catch(error => {
                        console.error(error);
                    })
                },
                allowOutsideClick: () => !Swal.isLoading()
            })
        });
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
            placement: "bottom",
            html: true,
            sanitize: false,
            content: `
                <div class="d-flex flex-column">
                    <button class="btn btn-light-warning d-grid place-items-center m-1 pt-2 pb-2" data-bs-toggle="modal" data-bs-target="#editUserModal" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}" data-bs-fullname="${popoverTriggerEl.getAttribute('data-bs-fullname')}">Ubah Data</button>
                    <button id="btnResetPasswordUser" class="btn btn-light-warning d-grid place-items-center m-1 pt-2 pb-2" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}" data-bs-fullname="${popoverTriggerEl.getAttribute('data-bs-fullname')}">Reset Password</button>
                    <button id="btnRemoveUser" class="btn btn-light-danger d-grid place-items-center m-1 pt-2 pb-2" data-bs-username="${popoverTriggerEl.getAttribute('data-bs-username')}" data-bs-fullname="${popoverTriggerEl.getAttribute('data-bs-fullname')}">Hapus</i></button>
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
    $('body').on('click', function(e) {
        if (typeof $(e.target).data('bs-original-title') == 'undefined' && !$(e.target).parents().is('.popover.in')) {
            $('[data-bs-original-title]').popover('hide');
        }
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
            confirmButtonText: 'Ya ',
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

let selectedInterestsDataTable;
let historyModal = new bootstrap.Modal(document.getElementById('historyModal'), {})

function initHistoryModalEvent() {
    document.querySelectorAll(".historyButton").forEach(e => {
        e.addEventListener("click", evt => {
            const username = evt.currentTarget.getAttribute('data-bs-username')

            fetch("../api/results/" + username)
                .then(response => response.json())
                .then(result => {
                    if (result.statusCode === 200) {
                        function refreshHistoryTable() {
                            fetch("../api/results/" + username)
                                .then(response => response.json())
                                .then(result => {

                                    if (result.data === undefined) {
                                        historyModal.hide();
                                        return;
                                    }

                                    let historyTable = document.querySelector('#historyTable');
                                    historyTable.innerHTML = "";

                                    if (typeof historyDataTable !== "undefined") {
                                        historyDataTable.destroy();
                                        historyDataTable = undefined;
                                    }
                                    let obj = {
                                        headings: ["Waktu", "_id", "_userId", "NIS", "Nama", "_typeid", "Tipe", "Nilai CF", "_avatarId", "Opsi"],
                                        data: []
                                    };

                                    for (let i = 0; i < result.data.length; i++) {
                                        obj.data[i] = [];
                                        for (let p in result.data[i]) {
                                            if (result.data[i].hasOwnProperty(p)) {
                                                obj.data[i].push(result.data[i][p]);
                                            }
                                        }
                                        obj.data[i].push("");

                                        obj.data[i][6] = parseFloat(obj.data[i][6]).toLocaleString("en", { style: "percent" })

                                        let time = dayjs(obj.data[i][7]).fromNow();
                                        obj.data[i].splice(7, 1);
                                        obj.data[i].splice(0, 0, time);
                                    }

                                    historyDataTable = new simpleDatatables.DataTable(historyTable, {
                                        columns: [
                                            { select: [1, 2, 5, 8], hidden: true },
                                            {
                                                select: 9,
                                                render: function (data, cell, row) {
                                                    return `
                                                        <td>
                                                            <div class="d-flex">
                                                                <button class="btnDetailHistory btn btn-light-primary me-1" data-id="${row.children.item(1).innerText}">Detail</button>
                                                                <button class="btnRemoveHistory btn btn-light-danger" data-id="${row.children.item(1).innerText}">Hapus</button>
                                                            </div>
                                                        </td>
                                                    `;
                                                }
                                            }
                                        ],
                                        data: obj
                                    });
                                    historyDataTable.on('datatable.init', initHistoryOptionButton);
                                    historyDataTable.on('datatable.update', initHistoryOptionButton);
                                    historyDataTable.on('datatable.page', initHistoryOptionButton);
                                });
                        }

                        function initHistoryOptionButton() {
                            initDetailHistory();
                            initDeleteHistory();
                        }

                        function initDetailHistory() {
                            const btnDetailHistory = document.querySelectorAll('.btnDetailHistory');
                            btnDetailHistory.forEach(item => {
                                item.addEventListener('click', evt => {
                                    const id = evt.currentTarget.getAttribute("data-id");

                                    fetch("../api/result-detail/" + id)
                                        .then(response => response.json())
                                        .then(result => {

                                            let tempData = []
                                            result.data.forEach(e => {
                                                tempData.push({
                                                    id: e.interestId,
                                                    userCF: e.value
                                                })
                                            })

                                            let postData = {
                                                saveHistory: "no",
                                                userInterests: tempData
                                            }

                                            fetch("../api/certainty-factor-v2", {
                                                method: "POST",
                                                headers: {
                                                    "ContentType": "application/json;charset=utf-8"
                                                },
                                                body: JSON.stringify(postData)
                                            })
                                                .then(response => response.json())
                                                .then(result => {
                                                    const name = document.querySelector("#name");
                                                    const fields = document.querySelector("#fields");
                                                    const detail = document.querySelector("#detail");
                                                    const advice = document.querySelector("#advice");
                                                    const otherPossibilities = document.querySelector("#otherPossibilities");
                                                    const selectedRulesElement = document.querySelector("#selectedRules");
                                                    const formula = document.querySelector("#formula");
                                                    const data = result.data.result;

                                                    formula.innerHTML = "";
                                                    selectedRulesElement.innerHTML = "";


                                                    name.textContent = `${data[0].name} (${(data[0].cf).toLocaleString("en", { style: "percent" })})`;
                                                    detail.textContent = data[0].detail;
                                                    advice.textContent = data[0].advice;
                                                    fields.textContent = data[0].fields;

                                                    if (data.length > 1) {
                                                        otherPossibilities.innerHTML = "";
                                                        for (let i = 1; i < data.length; i++) {
                                                            const li = document.createElement("li");
                                                            li.textContent = `${data[i].name} (${(data[i].cf).toLocaleString("en", { style: "percent" })})`
                                                            otherPossibilities.appendChild(li);
                                                        }
                                                    }

                                                    for (let i = 0; i < data.length; i++) {
                                                        const nameTypeLi = document.createElement("li");

                                                        const nameTypeSpan = document.createElement("span");
                                                        nameTypeSpan.textContent = data[i].name;

                                                        const formulaUl = document.createElement("ul");
                                                        for (let j = 0; j < data[i].rules.length; j++) {
                                                            const formulaLi = document.createElement("li");
                                                            formulaLi.textContent = `CF${j + 1} : ${data[i].rules[j].formula}`;
                                                            formulaUl.appendChild(formulaLi);
                                                        }
                                                        for (let k = 0; k < data[i].combinations.length; k++) {
                                                            if (data[i].combinations[k].formula !== "-") {
                                                                const formulaLi = document.createElement("li");
                                                                formulaLi.textContent = `CF Kombinasi ${k + 1} : ${data[i].combinations[k].formula}`;
                                                                formulaUl.appendChild(formulaLi);
                                                            }
                                                        }

                                                        nameTypeLi.appendChild(nameTypeSpan);
                                                        nameTypeLi.appendChild(formulaUl);

                                                        formula.appendChild(nameTypeLi);
                                                    }

                                                    const selectedRules = result.data.selectedRules;
                                                    let obj = {
                                                        headings: ["Ciri Minat Bakat", "MB", "MD"],
                                                        data: []
                                                    };
                                                    for (let i = 0; i < selectedRules.length; i++) {
                                                        obj.data[i] = [];
                                                        for (let p in selectedRules[i]) {
                                                            if (selectedRules[i].hasOwnProperty(p) && ["name", "mb", "md"].includes(p)) {
                                                                obj.data[i].push(selectedRules[i][p]);
                                                            }
                                                        }
                                                    }

                                                    if (selectedInterestsDataTable !== undefined) {
                                                        selectedInterestsDataTable.destroy();
                                                    }

                                                    selectedInterestsDataTable = new simpleDatatables.DataTable(selectedRulesElement, {
                                                        searchable: false,
                                                        paging: false,
                                                        data: obj
                                                    });

                                                    const carouselIndicators = document.querySelector(".carousel-indicators");
                                                    const carouselInner = document.querySelector(".carousel-inner");

                                                    carouselIndicators.innerHTML = "";
                                                    carouselInner.innerHTML = "";

                                                    for (let i = 0; i < data[0].pictures.length; i++) {
                                                        const clone = createElementFromHTML(`
                                                            <button type="button" data-bs-target="#carouselDetail">
                                                        `);
                                                        const clone2 = createElementFromHTML(`
                                                            <div class="carousel-item" data-bs-interval="2000">
                                                                <img src="" class="d-block w-100" alt="...">
                                                            </div>
                                                        `);

                                                        if (i === 0) {
                                                            clone.classList.add("active");
                                                            clone2.classList.add("active");
                                                        }

                                                        clone2.querySelector("img").src = "../assets/images/types/" + data[0].pictures[i].fileName;

                                                        carouselIndicators.appendChild(clone);
                                                        carouselInner.appendChild(clone2);
                                                    }
                                                    historyModal.hide();
                                                    resultModal.show();
                                                })
                                        });

                                });
                            })
                        }

                        function initDeleteHistory() {
                            const btnRemoveHistory = document.querySelectorAll('.btnRemoveHistory');
                            btnRemoveHistory.forEach(item => {
                                item.addEventListener('click', evt => {
                                    const id = evt.currentTarget.getAttribute("data-id");
                                    Swal.fire({
                                        title: 'Hapus',
                                        showCancelButton: true,
                                        confirmButtonText: 'Ya',
                                        cancelButtonText: 'Batal',
                                        showLoaderOnConfirm: true,
                                        preConfirm: (login) => {
                                            return fetch(`../api/result/${id}`, {
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
                                                    refreshHistoryTable();
                                                })
                                                .catch(error => {
                                                    console.error(error);
                                                })
                                        },
                                        allowOutsideClick: () => !Swal.isLoading()
                                    })
                                });
                            })
                        }

                        refreshHistoryTable()
                        historyModal.show()
                    } else {
                        showToast(404, "Data riwayat kosong")
                    }
                })
        })
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
            editForm["gender"].value = result.data[0]["Jenis Kelamin"]
            editForm["dateOfBirth"].value = result.data[0]["Tanggal Lahir"]
            editForm["address"].value = result.data[0]["Alamat"]
            editForm["privilege"].value = result.data[0]["Hak Akses"]
            editForm["avatarId"].value = result.data[0]["avatarId"]
            editForm["terverifikasi"].value = result.data[0]["terverifikasi"]
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

let resultModal = new bootstrap.Modal(document.querySelector('#resultModal'), {
    keyboard: false
});

function createElementFromHTML(htmlString) {
    let div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    return div.firstChild;
}