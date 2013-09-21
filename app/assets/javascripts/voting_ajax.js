$(document).ready(function(){
  $('form').on('ajax:success', function(e, data) {
    e.preventDefault();
    $(this).parent().children('div').html(data);
  });
})
