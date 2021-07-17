function initTypeSelects() {
    fetch("../api/types", {
        headers: {
            "ContentType": "application/json;charset=utf-8"
        }
    })
    .then(response => response.json())
    .then(result => {
        result.data.forEach(item => {
            const option = document.createElement("option");
            option.value = item.id;
            option.textContent = item.name;

            document.querySelectorAll(".typesSelect").forEach(select => {
                select.appendChild(option.cloneNode(true));
            });
        });
        
    });
}

initTypeSelects();

// Add simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let interestsDataTable;
refreshInterestsTable();

function refreshInterestsTable() {
    fetch("../api/interests-v2")
        .then(response => response.json())
        .then(result => {
            let interestsTable = document.querySelector('#interestsTable');
            interestsTable.innerHTML = "";

            if (typeof interestsDataTable !== "undefined") {
                interestsDataTable.destroy();
                interestsDataTable = undefined;
            }
            let obj = {
                headings: ["No", "_id", "Nama Ciri Minat Bakat", "_typeid", "Tipe", "Rule", "Opsi"],
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

            interestsDataTable = new simpleDatatables.DataTable(interestsTable, {
                columns: [
                    { select: [1, 3], hidden: true },
                    {
                        select: 6,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <div class="d-flex">
                                        <button class="btnEditInterest btn btn-light-warning me-1" data-id="${row.children.item(1).innerText}" data-name="${row.children.item(2).innerText}" data-type-id="${row.children.item(3).innerText}" data-mb="${row.children.item(5).innerText}">Ubah</button>
                                        <button class="btnRemoveInterest btn btn-light-danger" data-id="${row.children.item(1).innerText}" data-name="${row.children.item(2).innerText}">Hapus</button>
                                    </div>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            interestsDataTable.on('datatable.init', initOptionButton);
            interestsDataTable.on('datatable.update', initOptionButton);
            interestsDataTable.on('datatable.page', initOptionButton);
        });
}

function initOptionButton() {
    initEditInterest();
    initDeleteInterest();
}

function initEditInterest() {
    const btnEditInterests = document.querySelectorAll('.btnEditInterest');
    btnEditInterests.forEach(item => {
        item.addEventListener("click", evt => {
            addInterestForm.classList.add("d-none");
            editInterestForm.classList.remove("d-none");

            const id = evt.currentTarget.getAttribute("data-id");
            const name = evt.currentTarget.getAttribute("data-name");
            const typeId = evt.currentTarget.getAttribute("data-type-id");
            const mb = evt.currentTarget.getAttribute("data-mb");

            editInterestForm["_id"].value = id;
            editInterestForm["name"].value = name;
            editInterestForm["typeId"].value = typeId;
            editInterestForm["mb"].value = mb;

            window.scroll(0,0);
        });
    });
}

function initDeleteInterest() {
    const btnRemoveInterests = document.querySelectorAll('.btnRemoveInterest');
    btnRemoveInterests.forEach(item => {
        item.addEventListener('click', evt => {
            const id = evt.currentTarget.getAttribute("data-id");
            const name = evt.currentTarget.getAttribute("data-name");
            Swal.fire({
                title: 'Hapus',
                text: name,
                showCancelButton: true,
                confirmButtonText: 'Hapus',
                cancelButtonText: 'Batal',
                showLoaderOnConfirm: true,
                preConfirm: (login) => {
                    return fetch(`../api/interest-v2/${id}`, {
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
                            refreshInterestsTable();
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

// End simple data table ---------------------------------------------------------------------------


// Add interest Form +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let addInterestForm = document.forms["addInterestForm"];

addInterestForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(addInterestForm);
    const data = JSON.stringify(Object.fromEntries(formData))

    fetch("../api/interest-v2", {
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
                refreshInterestsTable();
                addInterestForm.reset();
            }
        })
        .catch(error => {
            console.error(error);
        })

});
// End add interest ---------------------------------------------------------------------------

// Edit interest Form +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let editInterestForm = document.forms["editInterestForm"];

editInterestForm["cancel"].addEventListener("click", evt => {
    editInterestForm.classList.add("d-none");
    addInterestForm.classList.remove("d-none");
});

editInterestForm.addEventListener("submit", evt => {
    evt.preventDefault();

    const formData = new FormData(editInterestForm);
    const data = JSON.stringify(Object.fromEntries(formData))

    fetch("../api/interest-v2/" + editInterestForm["_id"].value, {
        method: "PUT",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: data
    })
        .then(response => response.json())
        .then(result => {
            showToast(result.statusCode, result.message);
            if (result.statusCode === 200) {
                refreshInterestsTable();
                editInterestForm.classList.add("d-none");
                addInterestForm.classList.remove("d-none");
                editInterestForm.reset();
            }
        })
        .catch(error => {
            console.error(error);
        })

});
// End add interest ---------------------------------------------------------------------------