// Add simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let feedbackDataTable;
refreshFeedbackTable();

function refreshFeedbackTable() {
    fetch("../api/feedback")
        .then(response => response.json())
        .then(result => {

            if (result.data === undefined) {
                document.querySelector("#emptyLabel").classList.toggle("d-none")
                if (typeof feedbackDataTable !== "undefined") {
                    feedbackDataTable.destroy();
                    feedbackDataTable = undefined;
                }
                return;
            }

            let feedbackTable = document.querySelector('#feedbackTable');
            feedbackTable.innerHTML = "";

            if (typeof feedbackDataTable !== "undefined") {
                feedbackDataTable.destroy();
                feedbackDataTable = undefined;
            }
            let obj = {
                headings: ["Waktu", "_id", "_userId", "NIS", "Nama", "_typeid", "Tipe", "Nilai CF", "Opsi"],
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

                obj.data[i][6] = parseFloat(obj.data[i][6]).toLocaleString("en", {style: "percent"})

                let time = dayjs(obj.data[i][7]).fromNow();
                obj.data[i].splice(7, 1);
                obj.data[i].splice(0, 0, time);


            }

            console.log(obj.data);

            feedbackDataTable = new simpleDatatables.DataTable(feedbackTable, {
                columns: [
                    { select: [1, 2, 5], hidden: true },
                    {
                        select: 8,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <div class="d-flex">
                                        <button class="btnRemoveFeedback btn btn-light-danger" data-id="${row.children.item(1).innerText}">Hapus</button>
                                    </div>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
            feedbackDataTable.on('datatable.init', initOptionButton);
            feedbackDataTable.on('datatable.update', initOptionButton);
            feedbackDataTable.on('datatable.page', initOptionButton);
        });
}

function initOptionButton() {
    initDeleteFeedback();
}


function initDeleteFeedback() {
    const btnRemoveFeedback = document.querySelectorAll('.btnRemoveFeedback');
    btnRemoveFeedback.forEach(item => {
        item.addEventListener('click', evt => {
            const id = evt.currentTarget.getAttribute("data-id");
            Swal.fire({
                title: 'Hapus',
                showCancelButton: true,
                confirmButtonText: 'Hapus',
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
                            refreshfeedbackTable();
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