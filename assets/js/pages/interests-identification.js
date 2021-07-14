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