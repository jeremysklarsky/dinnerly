$(function(){
  addInviteGuestsListener();
})

function addInviteGuestsListener(){
  $('#menu').on("click", '#email-guests-btn', function(){
    $('form').removeClass("hidden");
    $('#email-guests-btn').replaceWith("<button id='add-guests-btn' class='btn btn-primary'>Add Another Guest</button><br>");
    $("#add-guests-btn").on("click", function(){
      $("#email-forms").append("<input class='additional-form' type='text' name='guest[emails][]' size='30' /><br><br>");
    })
  })
}

