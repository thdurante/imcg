//= require ./helpers/fix-height

$(document).ready(function () {
  $('.right-sidebar-toggle').on('click', function () {
    $('#right-sidebar').toggleClass('sidebar-open');
  });

  $('.sidebar-container').slimScroll({
    height: '100%',
    railOpacity: 0.4,
    wheelStep: 10
  });

  fix_height();

  $(window).bind("load", function () {
    if ($("body").hasClass('fixed-sidebar')) {
      $('.sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9
      });
    }
  });

  $(window).scroll(function () {
    if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
      $('#right-sidebar').addClass('sidebar-top');
    } else {
      $('#right-sidebar').removeClass('sidebar-top');
    }
  });

  $(window).bind("load resize scroll", function () {
    if (!$("body").hasClass('body-small')) {
      fix_height();
    }
  });
});
