let historyDataTable;

refreshHistoryDataTable();

function refreshHistoryDataTable() {
    fetch("history.json")
        .then(response => response.json())
        .then(data => {
            let historyTable = document.querySelector('#historyTable');
            historyTable.innerHTML = "";

            if (typeof usersDataTable !== "undefined") {
                usersDataTable.destroy();
                usersDataTable = undefined;
            }
            let obj = {
                headings: Object.keys(data[0]),
                data: []
            };
            obj.headings.push("Opsi")

            for (let i = 0; i < data.length; i++) {
                obj.data[i] = [];
                for (let p in data[i]) {
                    if (data[i].hasOwnProperty(p)) {
                        obj.data[i].push(data[i][p]);
                    }
                }
                obj.data[i].push("");
            }

            usersDataTable = new simpleDatatables.DataTable(historyTable, {
				paging: false,
				searchable: false,
                columns: [
                    {
                        select: 2,
                        render: function (data, cell, row) {
                            return `
                            <div class="avatar avatar-sm bg-warning me-2">
                                <img src="../assets/images/faces/${row.children.item(5).innerText}.jpg">
                            </div>
                            ${data}
                            `;
                        }
                    },
                    { select: [0,5], hidden: true },
                    {
                        select: 6,
                        render: function (data, cell, row) {
                            return `
                                <td>
                                    <button class="popover-option btn btn-light-primary font-bold"  data-bs-username='${row.children.item(0).innerText}'>...</button>
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
    addPopoverEvent();
}

function addPopoverEvent() {
    let popoverTriggerList = [].slice.call(document.querySelectorAll('.popover-option'))
    let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl, {
            trigger: "focus",
            placement: "bottom",
            html: true,
            sanitize: false,
            content: `
                <div class="d-flex">
                    <button class="btn btn-light-secondary d-grid place-items-center m-1 pt-2 pb-2" data-bs-toggle="modal" data-bs-target="#detailModal" data-bs-id="${popoverTriggerEl.getAttribute('data-bs-id')}">Detail</button>
                    <button class="btn btn-remove-user btn-light-danger d-grid place-items-center m-1 pt-2 pb-2" onclick="deleteHistory('${popoverTriggerEl.getAttribute('data-bs-id')}')">Hapus</i></button>
                </div>
            `
        })
    });
}

function deleteHistory(id) {
	// fetch()
	Toastify({
		text: "Berhasil menghapus data",
		duration: 3000,
		close: true,
		gravity: "top",
		position: "right",
		backgroundColor: "linear-gradient(135deg, #73a5ff, #5477f5)",
		stopOnFocus: true,
	}).showToast();
}


var optionsProfileVisit = {
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
		data: [9,20,30,20,10,20,30,20]
	}],
	colors: '#435ebe',
	xaxis: {
		categories: ["Kinesketik","Linguistik","Intra-personal","Inter-personal","Visual Spasial","Musikal","Matematika Logika", "Naturalis"],
	},
}
let optionsVisitorsProfile  = {
	series: [70, 30],
	labels: ['Registered', 'Anonymous'],
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



var chartProfileVisit = new ApexCharts(document.querySelector("#chart-profile-visit"), optionsProfileVisit);
var chartVisitorsProfile = new ApexCharts(document.getElementById('chart-visitors-profile'), optionsVisitorsProfile)

chartProfileVisit.render();
chartVisitorsProfile.render()