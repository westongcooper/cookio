

animate = function(){
  console.log('animate');
  $('.collapsible').collapsible({
    accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });
  var options = [
    {selector: '.finger', offset: 1000, callback: "Materialize.fadeInImage('#staggered-text')" },
    {selector: '.finger', offset: 1000, callback: "Materialize.showStaggeredList('#staggered-image')" }
  ];
  Materialize.scrollFire(options);
};

print_stuff2 = function(){
  $('a.animate').click();
  console.log('animate');
};

$(document).on('ready page:load', animate);
