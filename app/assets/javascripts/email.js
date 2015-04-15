$(function(){
  addCreateMenuListener();
})



function addCreateMenuListener(){

  $('#create-menu').on("click", function(){
    $('.email-guests').removeClass("hidden");
  })

}
