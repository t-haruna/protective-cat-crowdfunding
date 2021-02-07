$(function() {
  let percent = $( ".percent" ).val();
  let ratio = $( ".ratio" ).val();
  console.log(percent)
  //viewにてinputを用いて関数をvalueに当てることでJSで使用できるようにする
  if(ratio > 100){
    percent = "100%"
  }
  
  window.onload = function(){
    $(".contents-pacent__box2__graph2").css({ 'width' : percent } );
    }
});