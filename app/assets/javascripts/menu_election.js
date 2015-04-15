$(function(){
 
   chooseElectionListener();

})


function chooseElectionListener(e){
  $('#menu').on("change", "#election-option", function(){
    if ( $(this).val() == "Let your guests vote" ) {
      $("#exp").removeClass("hidden");
    }
    else {
      $("#exp").addClass("hidden");
    }
  });
}

