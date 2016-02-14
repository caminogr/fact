 $(function(){
    $("#datetimepicker").datepicker();
    });

 $(document).on("ready",function(){
  $("#prefectureSelect").change(function(){
    $("#citySelect").removeAttr("disabled")
  });
});
