$(document).ready(function () {
  $('.open-small-chat').on('click', function () {
    $(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
    $('.small-chat-box').toggleClass('active');
  });
  $('.small-chat-box .content').slimScroll({
    height: '234px',
    railOpacity: 0.4
  });
});
