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
                headings: ["No", "_id", "Nama Ciri Minat Bakat", "_typeid", "Tipe", "Rule"],
                data: []
            };

            for (let i = 0; i < result.data.length; i++) {
                obj.data[i] = [i + 1];
                for (let p in result.data[i]) {
                    if (result.data[i].hasOwnProperty(p)) {
                        obj.data[i].push(result.data[i][p]);
                    }
                }
            }

            interestsDataTable = new simpleDatatables.DataTable(interestsTable, {
                columns: [
                    { select: [1, 3], hidden: true }
                ],
                data: obj
            });
        });
}