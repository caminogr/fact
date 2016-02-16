 $(function(){
    $("#datetimepicker").datepicker();
    });

 $(document).on("ready",function(){
  $("#prefectureSelect").change(function(){
    $("#citySelect").removeAttr("disabled")
    var value = $('#prefectureSelect option:selected').val();
    $.ajax({
      type: "get",
      url: "/events/new"
    });
  });
});
