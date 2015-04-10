$(function(){

  addInviteGuestsListener();

})

function addInviteGuestsListener(){

  $('#email-guests-btn').on("click", function(){
    $('form').removeClass("hidden");
    // debugger;
    $('#email-guests-btn').html("<button id='add-guests-btn'>Add Another Guest</button>");
    $("#add-guests-btn").on("click", function(){
      $("#email-forms").append("<input type='text' name='guest[emails][]'/>");
    })
    
  })

}

