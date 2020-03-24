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


//funcion para incident admin
function btnSubmit() {
            
    if ( ($("#area_id").val() === "" || $("#area_id").val() === "-1") || ($("#operador_id").val() === "" || $("#operador_id").val() === "-1")){
        
    $("#btnAssignOperatorIncident").prop("disabled", true);      
   }else{        
    $("#btnAssignOperatorIncident").prop("disabled", false); 
    }
}

$(document).ready(function() {

    $("#area_id").change(function() {

        $.ajax({
            url: "/incident/admin/list/userArea",
            type: "POST",
            data: {"area_id" : $(this).val()},
            dataType: "json",
            success: function(data) {
                
                $('#operador_id').empty();
                $('#operador_id').append('<option value="-1">--- Seleccionar ---</option>');
                $.each(data, function(i, item) {
                   $('#operador_id').append('<option value="' + item.user.id + '">' + item.user.name + '</option>');
                });

            }
        }); 
    });


     $("#btnAssignOperatorIncident").click(function() {

        var assignIncident = {            
            operador_id :  $('#operador_id').val(),
            incidentmanagement_id :  $('#incidentmanagement_id').val()
        }
  
        $.ajax({
            url: "/incident/admin/assign/operator",
            type: "POST",
            data: assignIncident,
            dataType: "json",
            success: function(data) {
                console.log(data);
               $("#alert").empty();
                                                
                if (data.error == "false") {
                  window.location.replace("http://localhost:3000/incident/admin");
                }
            }
        });
    });
});