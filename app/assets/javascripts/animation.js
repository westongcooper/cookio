

animate = function(){
  console.log('animate');
  $('#cookio_animate').addClass('animated bounceInDown');
  $('.collapsible').collapsible({
    accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });
  var options = [
    {selector: '#icons_animate', offset: 800, callback: "Materialize.showStaggeredList('#icons_animate')" },
    {selector: '#how_cookio_animate', offset: 600, callback: "Materialize.fadeInImage('#how_cookio_animate')" },
    {selector: '#cookio_animate', offset: 0, callback: "becomeChef()" }
  ];
  Materialize.scrollFire(options);
};

print_stuff2 = function(){
  $('a.animate').click();
  console.log('animate');
};
becomeChef = function(){
  console.log('join us');
  Materialize.toast('<span>Now Hiring Chefs!&nbsp;</span><a class=&quot;btn-flat yellow-text&quot; href=/chefs/new> Join Us<a>', 10000)
};
$(document).on('ready page:load', animate);
//<a class=close>×<a>