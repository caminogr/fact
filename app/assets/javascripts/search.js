$(document).on("ready",function(){
  $('#header_search_box').keypress(function(e){
    if(e.which && e.which === 13 || e.keyCode && e.keyCode === 13){
      if(!$(this).val().match(/\S/g)){
        return false;
      }
    }
  });
});
