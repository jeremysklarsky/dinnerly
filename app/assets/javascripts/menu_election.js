$(function(){
   chooseElectionListener();
})

function chooseElectionListener(e){
  $('#menu').on("change", "#election-option", function(){
    if ( $(this).val() == "Let my guests vote!" ) {
      $("#exp").removeClass("hidden");
    }
    else {
      $("#exp").addClass("hidden");
    }
  });
}

