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

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.addEventListener('turbolinks:load', () => {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })

    var home = document.getElementById("link_home");
    var portfolio = document.getElementById("link_portfolio");
    var transactions = document.getElementById("link_transactions");
    
    home.addEventListener("click", setActiveLink );
    portfolio.addEventListener("click", setActiveLink);
    transactions.addEventListener("click", setActiveLink);

    function setActiveLink (e) {
        home.classList.remove("active");
        portfolio.classList.remove("active");
        transactions.classList.remove("active");

        let navlink = document.getElementById(e.target.id)
        navlink.classList.add("active")

    }
})