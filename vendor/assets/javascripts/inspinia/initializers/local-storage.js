//= require ./helpers/local-storage-support

$(document).ready(function () {
  if (localStorageSupport()) {
    var collapse = localStorage.getItem("collapse_menu");
    var fixedsidebar = localStorage.getItem("fixedsidebar");
    var fixednavbar = localStorage.getItem("fixednavbar");
    var boxedlayout = localStorage.getItem("boxedlayout");
    var fixedfooter = localStorage.getItem("fixedfooter");
    var body = $('body');

    if (fixedsidebar == 'on') {
      body.addClass('fixed-sidebar');
      $('.sidebar-collapse').slimScroll({
        height: '100%',
        railOpacity: 0.9
      });
    }

    if (collapse == 'on') {
      if (body.hasClass('fixed-sidebar')) {
        if (!body.hasClass('body-small')) {
          body.addClass('mini-navbar');
        }
      } else {
        if (!body.hasClass('body-small')) {
          body.addClass('mini-navbar');
        }
      }
    }

    if (fixednavbar == 'on') {
      $(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
      body.addClass('fixed-nav');
    }
    if (boxedlayout == 'on') { body.addClass('boxed-layout'); }
    if (fixedfooter == 'on') { $(".footer").addClass('fixed'); }
  }
});
