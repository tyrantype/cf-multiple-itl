let tempData = [];

//  simple datatable +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

let interestsData;
let interestsTable = document.querySelector('#interestsTable');
let interestsDataTable;

function getInterestsData() {
    fetch("../api/interests-v2?random=true")
        .then(response => response.json())
        .then(result => {
            interestsData = result.data;
            refreshInterestsTable(interestsData, false);
        });
}

getInterestsData();


function refreshInterestsTable(data, filter) {
    if (filter && tempData.length !== 0) {
        data = data.filter(v1 => tempData.map(v2 => v2.id).includes(v1.id));
    }

    interestsTable.innerHTML = "";

    if (typeof interestsDataTable !== "undefined") {
        interestsDataTable.destroy();
        interestsDataTable = undefined;
    }
    let obj = {
        headings: ["No", "_id", "Minat Bakat", "Kepercayaan"],
        data: []
    };

    for (let i = 0; i < data.length; i++) {
        obj.data[i] = [i + 1];
        for (let p in data[i]) {
            if (data[i].hasOwnProperty(p) && ["id", "name"].includes(p)) {
                obj.data[i].push(data[i][p]);
            }
        }
        obj.data[i].push("");
    }

    interestsDataTable = new simpleDatatables.DataTable(interestsTable, {
        perPageSelect: [7, 14, 21],
        perPage: 7,
        columns: [
            { select: 1, hidden: true },
            {
                select: 3,
                render: function (data, cell, row) {
                    const id = row.children.item(1).innerText;

                    let valueSelected = "";
                    if (tempData.length !== 0) {
                        const temp = tempData.find(v => v.id === id);
                        if (temp !== undefined) {
                            valueSelected = temp.userCF;
                        }
                    }
                    let options = { "": "", "1": "", "0.8": "", "0.6": "", "0.4": "", "0.2": "" };
                    options[valueSelected] = "selected";

                    return `
                        <td>
                            <div class="input-group">
                                <select class="form-select" id="select-md-${id}" data-id="${id}" >
                                    <option value="" disabled ${options[""]} hidden>Pilih</option>
                                    <option value="1" ${options["1"]} class="bg-success">Ya</option>
                                    <option value="0.8" ${options["0.8"]} class="bg-light-success">Mungkin ya</option>
                                    <option value="0.6" ${options["0.6"]} class="bg-light-secondary">Tidak tahu</option>
                                    <option value="0.4" ${options["0.4"]} class="bg-light-danger">Mungkin tidak</option>
                                    <option value="0.2" ${options["0.2"]} class="bg-danger">Tidak</option>
                                </select>
                                <label class="input-group-text p-0" for="select-md-${id}">
                                    <button type="button" id="btn-clear-md-${id}" class="btn btn-light-secondary" style="font-size:0.65em">x</button>
                                </label>
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

}

let isFiltered = false;

document.forms["demoForm"]["filter"].addEventListener("click", evt => {
    isFiltered = !isFiltered;
    refreshInterestsTable(interestsData, isFiltered)
});

document.forms["demoForm"].addEventListener("reset", evt => {
    tempData = [];
    refreshInterestsTable(interestsData, false);
});

let selectedInterestsDataTable;

document.forms["demoForm"].addEventListener("submit", evt => {
    evt.preventDefault();

    if (tempData.length !== 0) {
        fetch("../api/certainty-factor-v2", {
            method: "POST",
            headers: {
                "ContentType": "application/json;charset=utf-8"
            },
            body: JSON.stringify(tempData)
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


                name.textContent = `${data[0].name} (${(data[0].cf).toLocaleString("en", {style: "percent"})})`;
                detail.textContent = data[0].detail;
                advice.textContent = data[0].advice;
                fields.textContent = data[0].fields;

                if (data.length > 1) {
                    otherPossibilities.innerHTML = "";
                    for (let i = 1; i < data.length; i++) {
                        const li = document.createElement("li");
                        li.textContent = `${data[i].name} (${(data[i].cf).toLocaleString("en", {style: "percent"})})`
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
            });
    }
});

function initOptionButton() {
    initChangeInterest();
    initClearInterest();
}

function initChangeInterest() {
    document.querySelectorAll("select[id^=select-md-").forEach(select => {
        select.addEventListener("change", evt => {
            const id = select.getAttribute("data-id");
            const value = select.value;

            if (value !== "") {
                if (tempData.map(v => v.id).includes(id)) {
                    const index = tempData.findIndex(item => item.id === id);
                    tempData[index].userCF = value;
                } else {
                    tempData.push({
                        "id": id,
                        "userCF": value
                    });
                }
            } else {
                if (tempData.map(v => v.id).includes(id)) {
                    const index = tempData.findIndex(item => item.id === id);
                    tempData = tempData.filter(item => item.id !== id);
                }
            }
        });
    });
}

function initClearInterest() {
    document.querySelectorAll("button[id^=btn-clear-md-").forEach(btn => {
        btn.addEventListener("click", evt => {
            const select = btn.parentNode.parentNode.querySelector("select");
            select.value = "";

            select.dispatchEvent(new Event("change"))
        });
    });

}

// End simple data table ---------------------------------------------------------------------------

let resultModal = new bootstrap.Modal(document.querySelector('#resultModal'), {
    keyboard: false
});

var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-tooltip="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl, {
        trigger: "manual",
        placement: "left",
        title: tooltipTriggerEl.getAttribute("data-tooltip-title")
    })
})
tooltipList.forEach(el => {
    el._element.addEventListener("mouseenter", evt => {
        el.show();
    })
    el._element.addEventListener("mouseleave", evt => {
        el.hide();
    })
})

function createElementFromHTML(htmlString) {
    let div = document.createElement('div');
    div.innerHTML = htmlString.trim();
    return div.firstChild; 
  }