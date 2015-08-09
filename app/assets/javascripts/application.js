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
//= require materialize
//= require reservation
<<<<<<< HEAD
//= require home
=======
//= require Materialize/cards
>>>>>>> 59437144b0291c42f8ffd2cfaa8e07c48870517d
// require_tree .

function ready() {
  $('button span').text("$20.00 - Pay with card");
  $("#hamburger").click(function () {
    $("#menu-list").toggleClass("opacity");
    $(".slice").toggleClass("transform");
  });

  $("#reservation_plates").on("change", function(e){
    var price = 20;
    var multiplier = $(this).val();
    var priceToDisplay = '$' + String(price * multiplier) + '.00';
    $('#payment').text(priceToDisplay);
    $('button span').text(priceToDisplay + " - Pay with card");
  });



}
$(document).on('ready page:load', ready);
$(function() {
  $('.datepicker').datepicker({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  })});

