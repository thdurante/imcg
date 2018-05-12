function fix_height() {
  var heightWithoutNavbar = $("body > #wrapper").height() - 61;
  $(".sidebar-panel").css("min-height", heightWithoutNavbar + "px");

  var navbarheight = $('nav.navbar-default').height();
  var wrapperHeight = $('#page-wrapper').height();

  if (navbarheight > wrapperHeight) {
    $('#page-wrapper').css("min-height", navbarheight + "px");
  }

  if (navbarheight < wrapperHeight) {
    $('#page-wrapper').css("min-height", $(window).height() + "px");
  }

  if ($('body').hasClass('fixed-nav')) {
    if (navbarheight > wrapperHeight) {
      $('#page-wrapper').css("min-height", navbarheight + "px");
    } else {
      $('#page-wrapper').css("min-height", $(window).height() - 60 + "px");
    }
  }
}
