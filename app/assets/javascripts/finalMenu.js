$(function(){
  addMenuModalListener();
})

function addMenuModalListener(){
  $('.recipe-link').popover({ trigger: "hover", html: true });
}
