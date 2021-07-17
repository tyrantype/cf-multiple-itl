// Add simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let typesDataTable;
refreshTypesDataTable();

FilePond.registerPlugin(
    FilePondPluginImagePreview,
    FilePondPluginImageExifOrientation,
    FilePondPluginFileValidateSize,
    FilePondPluginFileValidateType,
    FilePondPluginFileRename,
    FilePondPluginFileMetadata
);

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
                    if (result.data[i].hasOwnProperty(p) && p !== "pictures") {
                        obj.data[i].push(result.data[i][p]);
                    }
                }
                obj.data[i].push("");
            }

            for (let v of obj.data) {
                if (v[3].length > 50) {
                    v[3] = v[3].substring(0, 50) + "...";
                }
                if (v[4].length > 40) {
                    v[4] = v[4].substring(0, 40) + "...";
                }
            }

            typesDataTable = new simpleDatatables.DataTable(typesTable, {
                columns: [
                    { select: [1], hidden: true },
                    {
                        select: 6,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <div class="d-flex">
                                        <button id="btnPreview" class="btn btn-light-info d-grid place-items-center me-1" data-bs-toggle="modal" data-bs-target="#previewModal" data-bs-id="${row.children.item(1).innerText}" data-bs-name="${row.children.item(2).innerText}">Preview</i></button>
                                        <button class="popover-option btn btn-light-primary font-bold"  data-bs-id='${row.children.item(1).innerText}' data-bs-name='${row.children.item(2).innerText}'>...</button>
                                    </div>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            typesDataTable.on('datatable.init', initOptionButton);
            typesDataTable.on('datatable.update', initOptionButton);
            typesDataTable.on('datatable.page', initOptionButton);
        });
}

function initOptionButton() {
    initPopoverEvent();
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
                    <button class="btn btn-light-warning d-grid place-items-center m-1 pt-2 pb-2" data-bs-toggle="modal" data-bs-target="#editTypeModal" data-bs-id="${popoverTriggerEl.getAttribute('data-bs-id')}" data-bs-name="${popoverTriggerEl.getAttribute('data-bs-name')}">Ubah</button>
                    <button id="btnRemoveType" class="btn btn-light-danger d-grid place-items-center m-1 pt-2 pb-2" data-bs-id="${popoverTriggerEl.getAttribute('data-bs-id')}" data-bs-name="${popoverTriggerEl.getAttribute('data-bs-name')}">Hapus</i></button>
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

// Add type +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
const addTypeModal = new bootstrap.Modal(document.querySelector('#addTypeModal'), {
    backdrop: "static",
    keyboard: false
});

const addTypeForm = document.forms["addTypeForm"];

const filepondAddTypeForm = FilePond.create(document.querySelector('#filepondAddTypeForm'), {
    acceptedFileTypes: ['image/*'],
    required: true,
    instantUpload: false,
    allowRevert: false,
    allowProcess: false,
    labelIdle: "Drag & Drop your files or Browse",
    maxParallelUploads: 1,
    server: {
        process: "../api/types-pictures"
    },
});

$('#tagsInputAdd').tagsinput({
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
    filepondAddTypeForm.removeFiles();
})

addTypeForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(addTypeForm);
    let data = Object.fromEntries(formData);
    delete data.images;
    data = JSON.stringify(data);

    fetch("../api/type", {
        method: "POST",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            if (result.statusCode === 200) {
                const length = filepondAddTypeForm.getFiles().length;
                for (let i = 0; i < length; i++) {
                    filepondAddTypeForm.getFile(i).setMetadata("typeId", result.insertId);
                    filepondAddTypeForm.getFile(i).setMetadata("deleteAll", i === 0);
                }
                
                filepondAddTypeForm.processFiles()
                    .then(file => {
                        refreshTypesDataTable();
                        addTypeForm.reset();
                        addTypeModal.hide();
                        
                        showToast(result.statusCode, result.message);
                    })
            }
        })
        .catch(error => {
            console.error(error);
        })

});
// End add type ---------------------------------------------------------------------------






// Edit type +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let editTypeModal = new bootstrap.Modal(document.querySelector('#editTypeModal'), {
    backdrop: "static",
    keyboard: false
});

const editTypeForm = document.forms["editTypeForm"];

const filepondEditTypeForm = FilePond.create(document.querySelector('#filepondEditTypeForm'), {
    acceptedFileTypes: ['image/*'],
    required: true,
    instantUpload: false,
    allowRevert: false,
    allowProcess: false,
    labelIdle: "Drag & Drop your files or Browse",
    maxParallelUploads: 1,
    server: {
        process: "../api/types-pictures"
    },
});

$('#tagsInputEdit').tagsinput({
    confirmKeys: [13, 44]
});

document.querySelector("#editTypeModal").addEventListener("show.bs.modal", evt => {
    const button = evt.relatedTarget
    const id = button.getAttribute('data-bs-id')
    const name = button.getAttribute('data-bs-name')
    const modalTitle = editTypeModal._element.querySelector('.modal-title')

    modalTitle.textContent = 'Ubah data ' + name

    fetch("../api/type/" + id, {
        headers: {
            "ContentType": "application/json;charset=utf-8;"
        }
    })
        .then(response => response.json())
        .then(result => {
            const form = document.forms["editTypeForm"]
            form["id"].value = id;
            form["name"].value = result.data[0].name;
            form["detail"].value = result.data[0].detail;
            form["advice"].value = result.data[0].advice;
            const arr = result.data[0].fields.split(",");
            arr.forEach(item => {
                $('#tagsInputEdit').tagsinput('add', item);
            });
            if (result.data[0].pictures != null) {
                result.data[0].pictures.forEach(item => {
                    filepondEditTypeForm.addFile("../assets/images/types/" + item.fileName)
                });
            }
        })

});

document.querySelector("#editTypeModal").addEventListener("hide.bs.modal", evt => {
    editTypeForm.reset();
});

editTypeForm.addEventListener("reset", evt => {
    $('.tags-input').tagsinput('removeAll');
    filepondEditTypeForm.removeFiles();
})

editTypeForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(editTypeForm);
    let data = Object.fromEntries(formData);
    delete data.images;
    data = JSON.stringify(data);

    fetch("../api/type/" + editTypeForm["id"].value, {
        method: "PUT",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            if (result.statusCode === 200) {
                const length = filepondEditTypeForm.getFiles().length;
                for (let i = 0; i < length; i++) {
                    filepondEditTypeForm.getFile(i).setMetadata("typeId", result.id);
                    filepondEditTypeForm.getFile(i).setMetadata("deleteAll", i === 0);
                }
                
                filepondEditTypeForm.processFiles()
                    .then(file => {
                        refreshTypesDataTable();
                        editTypeForm.reset();
                        editTypeModal.hide();
                        
                        showToast(result.statusCode, result.message);
                    })
            }
        })
        .catch(error => {
            console.error(error);
        })

});

// End edit type ---------------------------------------------------------------------------

document.querySelector("#previewModal").addEventListener("show.bs.modal", evt => {
    const button = evt.relatedTarget
    const id = button.getAttribute('data-bs-id')
    const name = button.getAttribute('data-bs-name')

    fetch("../api/type/" + id, {
        headers: {
            "ContentType": "application/json;charset=utf-8"
        }
    })
    .then(response => response.json())
    .then(result => {
        document.querySelector("#namePreview").textContent = result.data[0].name
        document.querySelector("#fieldsPreview").textContent = result.data[0].fields
        document.querySelector("#detailPreview").textContent = result.data[0].detail
        document.querySelector("#advicePreview").textContent = result.data[0].advice

        const carouselIndicators = document.querySelector(".carousel-indicators");
        const carouselInner = document.querySelector(".carousel-inner");

        carouselIndicators.innerHTML= "";
        carouselInner.innerHTML = "";
        
        for (let i = 0; i < result.data[0].pictures.length; i++) {
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

            clone2.querySelector("img").src = "../assets/images/types/" + result.data[0].pictures[i].fileName ;

            carouselIndicators.appendChild(clone);
            carouselInner.appendChild(clone2);
        }
    });
})

function createElementFromHTML(htmlString) {
    let div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    return div.firstChild; 
  }