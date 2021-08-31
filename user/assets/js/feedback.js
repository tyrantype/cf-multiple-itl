var quill = new Quill('#editor', {
    theme: 'snow',
    placeholder: 'Kirim laporan bug, saran atau masukan pada aplikasi ini',
});
quill.root.setAttribute('spellcheck', false)

document.getElementById("sendFeedback").addEventListener("click", evt => {
    if (quill.getText().trim() === "") {
        return
    }
    const data = {
        content: quill.root.innerHTML
    }
    fetch("../api/feedback", {
        method: "POST",
        headers: {
            "ContentType": "application/json;charset=utf-8"
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        showToast(result.statusCode, result.message)
        if (result.statusCode === 200) quill.setText("")
    })
})
