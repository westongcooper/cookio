

animate = function(){
  $('.button-collapse').sideNav();
  //$('button-collapse').click(function() {
  //  console.log('button click');
  //});
  console.log('working?');
  var options = [
    {selector: '.make-a-reservation', offset: 1000, callback: "Materialize.showStaggeredList('#staggered-test')" }
  ];
  Materialize.scrollFire(options);
};

print_stuff2 = function(){
  $('a.animate').click();
  console.log('animate');
};

$(document).ready(animate());
$(document).on('page:load', animate());