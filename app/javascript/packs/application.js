// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import * as bootstrap from 'bootstrap'
import 'stylesheets/application'
import Chart from 'chart.js/auto'
import ApexCharts from 'apexcharts'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
window.bootstrap = bootstrap
window.ApexCharts = ApexCharts

window.addEventListener('turbolinks:load', () => {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })   

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: JSON.parse(ctx.canvas.dataset.labels),
        datasets: [{
        data: JSON.parse(ctx.canvas.dataset.data),
        }]
    },
    });
})