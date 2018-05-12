$(document).ready(function () {
  if ($(this).width() < 769) {
    $('body').addClass('body-small')
  } else {
    $('body').removeClass('body-small')
  }
});
