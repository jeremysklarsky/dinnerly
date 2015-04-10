$(function(){

  addInviteGuestsListener();

})

function addInviteGuestsListener(){

  $('#email-guests-btn').on("click", function(){
    $('form').removeClass("hidden");
    // debugger;
    $('#email-guests-btn').replaceWith("<button id='add-guests-btn' class='btn btn-primary'>Add Another Guest</button><br>");
    $("#add-guests-btn").on("click", function(){
      debugger;
      $("#email-forms").append("<input type='text' name='guest[emails][]'/>");
    })
    
  })

}

