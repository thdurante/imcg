function SmoothlyMenu() {
  if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
    $('#side-menu').hide();
    setTimeout(function () {
      $('#side-menu').fadeIn(400);
    }, 200);
  } else if ($('body').hasClass('fixed-sidebar')) {
    $('#side-menu').hide();
    setTimeout(function () {
      $('#side-menu').fadeIn(400);
    }, 100);
  } else {
    $('#side-menu').removeAttr('style');
  }
}
