// history datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let historyDataTable;
refreshHistoryTable();

function refreshHistoryTable() {
    fetch("../api/results")
        .then(response => response.json())
        .then(result => {

            if (result.data === undefined) {
                document.querySelector("#emptyLabel").classList.toggle("d-none")
                if (typeof historyDataTable !== "undefined") {
                    historyDataTable.destroy();
                    historyDataTable = undefined;
                }
                return;
            }

            let historyTable = document.querySelector('#historyTable');
            historyTable.innerHTML = "";

            if (typeof historyDataTable !== "undefined") {
                historyDataTable.destroy();
                historyDataTable = undefined;
            }
            let obj = {
                headings: ["Waktu", "_id", "_userId", "NIS", "Nama", "_typeid", "Tipe", "CF", "_avatarId", "Opsi"],
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
                
                obj.data[i][3] = obj.data[i][3].split(" ")[0]

                obj.data[i][6] = parseFloat(obj.data[i][6]).toLocaleString("en", {style: "percent", maximumSignificantDigits: 3})

                let time = dayjs(obj.data[i][7]).fromNow();
                obj.data[i].splice(7, 1);
                obj.data[i].splice(0, 0, time);
            }

            obj.data = obj.data.slice(0, 3 );

            historyDataTable = new simpleDatatables.DataTable(historyTable, {
                columns: [
                    { select: [1, 2, 3, 5, 8], hidden: true },
                    { 
                        select: 4,
                        render: function (data, cell, row) {
                            return `
                            <div class="avatar avatar-sm me-2">
                                <img src="../assets/images/faces/${row.children.item(8).innerText}.jpg">
                                <span class="ms-2">${data}</span>
                            </div>
                            `;
                        }
                    },
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
            historyDataTable.on('datatable.init', initOptionButton);
            historyDataTable.on('datatable.update', initOptionButton);
            historyDataTable.on('datatable.page', initOptionButton);
        });
}

function initOptionButton() {
    initDetailHistory();
    initDeleteHistory();
}

let selectedInterestsDataTable;

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


                name.textContent = `${data[0].name} (${(data[0].cf).toLocaleString("en", {style: "percent", maximumSignificantDigits: 3})})`;
                detail.textContent = data[0].detail;
                advice.textContent = data[0].advice;
                fields.textContent = data[0].fields;

                if (data.length > 1) {
                    otherPossibilities.innerHTML = "";
                    for (let i = 1; i < data.length; i++) {
                        const li = document.createElement("li");
                        li.textContent = `${data[i].name} (${(data[i].cf).toLocaleString("en", {style: "percent", maximumSignificantDigits: 3})})`
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

                carouselIndicators.innerHTML= "";
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

let resultModal = new bootstrap.Modal(document.querySelector('#resultModal'), {
    keyboard: false
});

function createElementFromHTML(htmlString) {
    let div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    return div.firstChild; 
}
// End history table ---------------------------------------------------------------------------

fetch("../api/total-dashboard.php")
.then(response => response.json())
.then(result => {
    document.getElementById("totalUsers").innerText = result.data[0].users
    document.getElementById("totalTypes").innerText = result.data[0].types
    document.getElementById("totalRules").innerText = result.data[0].rules
    document.getElementById("totalHistory").innerText = result.data[0].history
    
})

fetch("../api/setting")
.then(response => response.json())
.then(result => {
    document.getElementById("schoolName").innerText = result.data[0].schoolName
    document.getElementById("schoolAddress").innerText = result.data[0].address
})

fetch("../api/feedback")
.then(response => response.json())
.then(result => {
    const feedback = document.getElementById("feedback-list")
    const viewMoreFeedback = document.getElementById("viewMoreFeedback")
    const data = result.data.slice(0, 3)
    data.forEach(v => {
        feedback.insertBefore(createElementFromHTML(`
            <div class="recent-message d-flex px-4 py-3">
                <div class="avatar avatar-lg">
                    <img src="../assets/images/faces/${v.avatarId}.jpg">
                </div>
                <div class="name ms-4">
                    <h5 class="mb-1">${v.fullname.split(" ")[0]}</h5>
                    <h6 class="text-muted mb-0">@${v.username}</h6>
                </div>
            </div>
        `), viewMoreFeedback)
    })
})

fetch("../api/total-history.php")
.then(response => response.json())
.then(result => {
    const categories = result.data.map(e => e.name);
    const data = result.data.map(e => e.total);
    var optionsTotalTest = {
        annotations: {
            position: 'back'
        },
        dataLabels: {
            enabled:false
        },
        chart: {
            type: 'bar',
            height: 300
        },
        fill: {
            opacity:1
        },
        plotOptions: {
        },
        series: [{
            name: 'Jumlah',
            data: data
        }],
        colors: '#435ebe',
        xaxis: {
            categories: categories,
        },
    }
    var chartTotalTest = new ApexCharts(document.querySelector("#chart-profile-visit"), optionsTotalTest);
    chartTotalTest.render();
})

fetch("../api/total-users-by-gender.php")
.then(response => response.json())
.then(result => {
    const data = result.data[0];
    let optionTotalUsers  = {
        series: [parseInt(result.data[0].percentage), parseInt(result.data[1].percentage)],
        labels: [result.data[0].gender, result.data[1].gender],
        colors: ['#435ebe','#55c6e8'],
        chart: {
            type: 'donut',
            width: '100%',
            height:'350px'
        },
        legend: {
            position: 'bottom'
        },
        plotOptions: {
            pie: {
                donut: {
                    size: '30%'
                }
            }
        }
    }
    var chartTotalUsers = new ApexCharts(document.getElementById('chart-visitors-profile'), optionTotalUsers)
    chartTotalUsers.render()
})