$(function(){
  addScrollBottomListener();
  addScrollTopListener();
})

function addScrollBottomListener(){
  $("#learnMore").click(function() {
    scrollBottom();
  });
}

function addScrollTopListener(){
  $("#scrollBack").click(function(){
    $('html, body').animate({scrollTop:0}, 'slow');
  })
}

function scrollBottom(){
  $('html, body').animate({scrollTop:$(document).height()}, 'slow');
}

function scrollTop(){
  $('html, body').animate({scrollTop:$(document).height()}, 'slow');
}