

animate = function(){
  console.log('working?');
  var options = [
    {selector: '.make-a-reservation', offset: 1500, callback: 'print_stuff()' }
  ];
  Materialize.scrollFire(options);
};

print_stuff = function(){
  alert('test');
};
$(document).ready(animate());
$(document).on('page:load', animate());