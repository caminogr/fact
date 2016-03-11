$(document).on("ready page:load",function(){
  $('.group-image-field').change(function(){
    console.log(1)
    $('.group-image-submit').removeClass('display-none');
  });
});
