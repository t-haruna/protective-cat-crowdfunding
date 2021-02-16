//詳細画面での進捗率メーター表示
$(function() {
  let percent = $( ".percent" ).val();
  let ratio = $( ".ratio" ).val();
  //viewにてinputを用いて関数をvalueに当てることでJSで使用できるようにする
  if(ratio > 100){
    percent = "100%"
  }
  window.onload = function(){
    $(".contents-pacent__box2__graph2").css({ 'width' : percent } );
    }
});

//トップ画面での進捗率メーター表示
$(function() {
  //let percent = $( ".percent-top" ).val();
  //let ratio = $( ".ratio-top" ).val();
  
 

  $('.percent').each(function(i){
    $(this).attr('id',i+1);
    var percentid = $(this).attr('id').replace(/[^0-9]/g, '');
  });

  $('.contents-pacent__box2__graph2').each(function(i){
    $(this).attr('id',i+1);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    //$('.percent').attr({id:`box-${id}`});
    console.log(id)
  });
  

  if (id == percentid ) {
    let percent = $( ".percent" ).val();
    //let ratio = $( ".ratio" ).val();
    //console.log(id)
    // if(ratio > 100){
    //   percent = "100%"
    // }
    window.onload = function(){
      $(".contents-pacent__box2__graph2").css({ 'width' : percent } );
     }
    }
});

  
    
  