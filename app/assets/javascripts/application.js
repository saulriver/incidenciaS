//= require jquery
//= require rails-ujs
//= require activestorage
//= require jquery-fileupload
//= require Chart.bundle
//= require chartkick
//= require turbolinks
//= require_tree .

function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}

function openLink(evt, linkName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(linkName).style.display = "block";
    evt.currentTarget.className += " active";
}

function myFunction() {
    var element = document.body;
    element.classList.toggle("dark-mode");
    var element = document.div;
    element.classList.toggle("dark-mode");
}

