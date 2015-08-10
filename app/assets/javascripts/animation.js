

animate = function(){
  console.log('working?');
  console.log('recipes?');
  $('.collapsible').collapsible({
    accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });
  var options = [
    {selector: '.make-a-reservation', offset: 1000, callback: "Materialize.showStaggeredList('#staggered-test')" }
  ];
  Materialize.scrollFire(options);
};

print_stuff2 = function(){
  $('a.animate').click();
  console.log('animate');
};

$(document).on('ready page:load', animate);