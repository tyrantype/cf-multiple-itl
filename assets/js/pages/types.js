// Add simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let typesDataTable;
refreshTypesDataTable();

function refreshTypesDataTable() {
    fetch("../api/types")
        .then(response => response.json())
        .then(result => {
            let typesTable = document.querySelector('#typesTable');
            typesTable.innerHTML = "";

            if (typeof typesDataTable !== "undefined") {
                typesDataTable.destroy();
                typesDataTable = undefined;
            }
            let obj = {
                headings: ["No", "id", "Nama", "Keterangan", "Saran", "Pekerjaan Terkait", "Opsi"],
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

            typesDataTable = new simpleDatatables.DataTable(typesTable, {
                columns: [
                    { select: [1], hidden: true },
                    {
                        select: 6,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <button class="popover-option btn btn-light-primary font-bold"  data-bs-id='${row.children.item(1).innerText}' data-bs-name='${row.children.item(2).innerText}'>...</button>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            typesDataTable.on('datatable.init', initOptionButton);
            typesDataTable.on('datatable.update', initOptionButton);
        });
}

function initOptionButton() {
    initPopoverEvent();
    // initHistoryModalEvent();
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
                    <button class="btn btn-light-warning d-grid place-items-center m-1 pt-2 pb-2" data-bs-toggle="modal" data-bs-target="#editTypeModal" data-bs-name="${popoverTriggerEl.getAttribute('data-bs-name')}" data-bs-name="${popoverTriggerEl.getAttribute('data-bs-name')}">Ubah</button>
                    <button id="btnRemoveType" class="btn btn-light-danger d-grid place-items-center m-1 pt-2 pb-2" data-bs-id="${popoverTriggerEl.getAttribute('data-bs-id')}">Hapus</i></button>
                </div>
            `
        })
    });
    popoverTriggerList.forEach(el => {
        el.addEventListener("click", evt => {
            initDeleteTypeEvent();
        })
    });
}


function initDeleteTypeEvent() {
    const btnRemoveUser = document.querySelector('#btnRemoveType');
    btnRemoveUser.addEventListener('click', evt => {
        const name = evt.currentTarget.getAttribute("data-bs-name");
        const id = evt.currentTarget.getAttribute("data-bs-id");
        Swal.fire({
            title: 'Hapus ' + name,
            showCancelButton: true,
            confirmButtonText: 'Hapus',
            cancelButtonText: 'Batal',
            showLoaderOnConfirm: true,
            preConfirm: (login) => {
                return fetch(`../api/type/${id}`, {
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
                        refreshTypesDataTable();
                    })
                    .catch(error => {
                        console.error(error);
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        })
    });
}

// function initHistoryModalEvent() {
//     let editUserModal = document.getElementById('historyModal')
//     editUserModal.addEventListener('show.bs.modal', function (event) {
//         let button = event.relatedTarget
//         let username = button.getAttribute('data-bs-username')
//         let modalTitle = editUserModal.querySelector('.modal-title')

//         modalTitle.textContent = 'Riwayat identifikasi ' + username
//     })
// }

// End simple data table ---------------------------------------------------------------------------


// Add user +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let addTypeModal = new bootstrap.Modal(document.querySelector('#addTypeModal'), {
    backdrop: "static",
    keyboard: false
});
let addTypeForm = document.forms["addTypeForm"];

$(document).keypress(
    function(event){
      if (event.which == '13' || event.which == '44') {
        event.preventDefault();
      }
  });

  $('.tags-input').tagsinput({
    confirmKeys: [13, 44]
  });

document.querySelector("#addTypeButton").addEventListener("click", evt => {
    addTypeModal.show();
});

document.querySelector("#addTypeModal").addEventListener("hide.bs.modal", evt => {
    addTypeForm.reset();
});

addTypeForm.addEventListener("reset", evt => {
    $('.tags-input').tagsinput('removeAll');
})

addTypeForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(addTypeForm);
    const data = JSON.stringify(Object.fromEntries(formData))

    fetch("../api/types", {
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
                refreshTypesDataTable();
                addTypeForm.reset();
                addTypeModal.hide();
            }
        })
        .catch(error => {
            console.error(error);
        })

});
// End add user ---------------------------------------------------------------------------

// // Edit user +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// let editTypeModal = new bootstrap.Modal(document.querySelector('#editTypeModal'), {
//     backdrop: "static",
//     keyboard: false
// });
// let editTypeForm = document.forms["editTypeForm"];

// document.querySelector("#editTypeModal").addEventListener("show.bs.modal", evt => {
//     const button = evt.relatedTarget
//     const fullname = button.getAttribute('data-bs-fullname')
//     const username = button.getAttribute('data-bs-username')
//     const modalTitle = editTypeModal._element.querySelector('.modal-title')

//     modalTitle.textContent = 'Ubah data ' + fullname

//     fetch("../api/user/" + username, {
//         headers: {
//             "ContentType": "application/json;charset=utf-8;"
//         }
//     })
//         .then(response => response.json())
//         .then(result => {
//             const editForm = document.forms["editTypeForm"]
//             editForm["fullName"].value = result.data[0]["Nama Lengkap"]
//             editForm["oldId"].value = result.data[0]["id"]
//             editForm["username"].value = result.data[0]["Username"]
//             editForm["privilege"].value = result.data[0]["Hak Akses"]
//             editForm["avatarId"].value = result.data[0]["avatarId"]
//         })

// });

// document.querySelector("#editTypeModal").addEventListener("hide.bs.modal", evt => {
//     editTypeForm.reset();
// });

// editTypeForm.addEventListener("submit", evt => {
//     evt.preventDefault();

//     const formData = new FormData(editTypeForm);
//     const data = JSON.stringify(Object.fromEntries(formData));
//     const username = editTypeForm["oldId"].value;

//     fetch("../api/type/" + username, {
//         method: "PATCH",
//         headers: {
//             "ContentType": "application/json;charset=utf-8"
//         },
//         body: data
//     })
//         .then(response => response.json())
//         .then(result => {
//             showToast(result.statusCode, result.message);
//             if (result.statusCode === 200) {
//                 refreshTypesDataTable();
//                 editTypeForm.reset();
//                 editTypeModal.hide();
//             }
//         })
//         .catch(error => {
//             console.error(error);
//         })
// });

// End edit user ---------------------------------------------------------------------------