$(function () {
  $("#plus-btn").on("click", function () {
    $(".url-box-hidden:first").clone(false).css('display', 'flex').appendTo($(".url-box-set"));
  });
});