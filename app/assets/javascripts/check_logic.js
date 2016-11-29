$(document).ready(function(){

  $(".checkbox-trigger").click(function(){
    $(this).parent().find(".fa").toggleClass("fa-times");
    $(this).parent().find(".fa").toggleClass("fa-check");

    $(this).parent().parent().toggleClass("check");

  });

});
