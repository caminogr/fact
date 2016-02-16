 $(function(){
    $("#datetimepicker").datepicker();
    });

 $(document).on("ready",function(){
  $("#prefectureSelect").change(function(){
    $("#citySelect").removeAttr("disabled")
    var value = $('#prefectureSelect option:selected').val();
    $.ajax({
      type: "get",
      url: "/events/new",
      data: {
              prefecture_id: value
            },
      success: function(data){
        $("#citySelect").empty()
        data.cities.map(function(city){
          $("#citySelect").append(
            $("<option>").val(city.id).text(city.name)
          );
        });
      }
    });
  });
});
