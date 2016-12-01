$(document).ready(function(){
  $(document).on('click', '.checkbox-trigger', function() {
  // $(".checkbox-trigger").click(function(){
  //   $(this).parent().parent().toggleClass("check");
  // });

    //
      // $(this).parent().parent().toggleClass("check-in-red");

      if($(this).hasClass( "question-in-myquestion" )){
        $(this).parent().parent().toggleClass("check-in-blue");
      }
    });

    $(".tab").click(function(){
      var target = $(this).data('target');
      $(".tab-pane").addClass("hidden");
      $(target).removeClass("hidden");
    //
  });

  $(".checkbox-trigger").click(function(){
        if($(this).hasClass( "question-in-category" )){
      $(this).parent().parent().toggleClass("check-in-red");
    }
  });
});
