$(document).ready(function(){
  $("#inputfield1").hide();
  $("#inputfield2").hide();
});

$('#category').change(function() {
  if( $(this).val() == 1 ) {
    $("#inputfield1").show();
    $("#inputfield2").hide();
  }
  if( $(this).val() == 4 ) {
    $("#inputfield2").show();
    $("#inputfield1").hide();
  }
});
