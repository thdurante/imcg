//= require ./helpers/smoothly-menu

$(document).ready(function () {
  $('#side-menu').metisMenu();

  $('.close-canvas-menu').on('click', function () {
    $("body").toggleClass("mini-navbar");
    SmoothlyMenu();
  });

  $('body.canvas-menu .sidebar-collapse').slimScroll({
    height: '100%',
    railOpacity: 0.9
  });

  $('.navbar-minimalize').on('click', function (event) {
    event.preventDefault();
    $("body").toggleClass("mini-navbar");
    SmoothlyMenu();
  });
});

$(window).bind("resize", function () {
  if ($(this).width() < 769) {
    $('body').addClass('body-small')
  } else {
    $('body').removeClass('body-small')
  }
});
