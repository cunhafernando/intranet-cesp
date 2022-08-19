// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "@adminkit/core/dist/js/app"
import "bootstrap-table/dist/bootstrap-table"
import "chartkick/chart.js"
import "chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels"
import "bootstrap/dist/js/bootstrap.bundle"

var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})
