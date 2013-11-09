$(window).on('load', function () {
  var buttons = $('.btn');
  buttons.on('touchstart', function () {
    $(this).addClass('btn_active');
    $.post('/' + $(this).attr('id'), {}, function () {});
    return false;
  });

  $(document).on('touchend', function () {
    buttons.removeClass('btn_active');
  });
});
