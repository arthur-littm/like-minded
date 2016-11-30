$(document).ready(function(){

  $(".checkbox-trigger").click(function(){
    $(this).parent().parent().toggleClass("check");
  });

  $(".tab").click(function(){
    var target = $(this).data('target');
    $(".tab-pane").addClass("hidden");
    $(target).removeClass("hidden");
  });
});
