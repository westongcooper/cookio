

animate = function(){
  console.log('animate');
  $('.collapsible').collapsible({
    accordion : true // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });
  var options = [
    {selector: '#bitme', offset: 800, callback: "Materialize.showStaggeredList('#staggered-text')" },
    {selector: '#bitme', offset: 800, callback: "Materialize.showStaggeredList('#staggered-image')" },
    {selector: '#bitme', offset: 500, callback: "becomeChef()" }
  ];
  Materialize.scrollFire(options);
};

print_stuff2 = function(){
  $('a.animate').click();
  console.log('animate');
};
becomeChef = function(){
  Materialize.toast('<span>Now Hiring Chefs!&nbsp;</span><a class=&quot;btn-flat yellow-text&quot; href=/chefs/new> JOIN<a>', 200000)
};
$(document).on('ready page:load', animate);
