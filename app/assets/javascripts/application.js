// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require jquery.noty.packaged.min.js
//= require_tree .


$(document).ready(function() {


    var textarea = document.getElementById('message_content');
    console.log(textarea);


    var char = document.getElementById('characters');
    var create_message_submit = document.getElementById('create_question');
    console.log(char);

    if (textarea){
         textarea.addEventListener('input', function() {
        console.log(textarea.value.length);


        char.innerHTML = textarea.value.length;
       
          if (textarea.value.length > 140) {
            char.style.color = "red";
            create_message_submit.disabled = true;


        } else {
            char.style.color = "black";
            create_message_submit.disabled = false;

        }
    });
    }
   
});