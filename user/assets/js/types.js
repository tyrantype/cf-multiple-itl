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
                                        <button id="btnPreview" class="btn btn-light-info d-grid place-items-center me-1" data-bs-toggle="modal" data-bs-target="#previewModal" data-bs-id="${row.children.item(1).innerText}" data-bs-name="${row.children.item(2).innerText}">Lihat</i></button>
                                    </div>
                                </td>
                            `;
                        }
                    }
                ],
                data: obj
            });
        });
}


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