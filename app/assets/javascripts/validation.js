var v_helper = function(validation_stats){
  for (var stat in validation_stats){
    if (validation_stats[stat] === ''){
      return false;
    }
  }
  return true;
};


var validations_new_chef = function(){
  var reservation_stats = {
    email: $('input.validate.email').val(),
    first_name: $('input.validate.first_name').val(),
    last_name: $('input.validate.last_name').val(),
    address: $('input.validate.address').val(),
    city: $("input.validate.city").val(),
    state: $("input.validate.state").val(),
    zip: $("input.validate.zip").val(),
    phone: $("input.validate.phone").val(),
    password: $("input.validate.password").val(),
    password_confirmation: $("input.validate.password_confirmation").val(),
  };

  if (!v_helper(reservation_stats)){
    Materialize.toast('Please enter all fields.', 3000, 'toast_alert');
    return false;
  }
  return true;
};

var validations_new_user = function(){
  var reservation_stats = {
    email: $('input.validate.email').val(),
    first_name: $('input.validate.first_name').val(),
    last_name: $('input.validate.last_name').val(),
    password: $("input.validate.password").val(),
    password_confirmation: $("input.validate.password_confirmation").val(),
  };

  if (!v_helper(reservation_stats)){
    Materialize.toast('Please enter all fields.', 3000, 'toast_alert');
    return false;
  }
  return true;
};

validate = function() {
  $('form#new_chef button.submit_button').on('click', function () {
    // Open Checkout with further options
    if (!validations_new_chef()) {
      console.log('Second check');
      return false;
    }
  });
  $('form#new_user button.submit_button').on('click', function () {
    // Open Checkout with further options
    if (!validations_new_user()) {
      console.log('Second check');
      return false;
    }
  });

};





$(document).ready(validate);
$(document).on('page:load', validate);