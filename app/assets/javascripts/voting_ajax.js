$(document).ready(function(){
  $('form').on('ajax:success', function(e, data) {
    e.preventDefault();
    $(this).parent().children('span').html(data);
  });
})
