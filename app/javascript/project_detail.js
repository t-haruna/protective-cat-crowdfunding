//詳細画面での進捗率メーター表示
$(function() {
  let percent = $( ".percent" ).val();
  let ratio = $( ".ratio" ).val();
  //viewにてinputを用いて関数をvalueに当てることでJSで使用できるようにする
  window.onload = function(){
    $(".contents-pacent__box2__graph2").css({ 'width' : percent } );
    }
});

//トップ画面での進捗率メーター表示
$(function() {
  $('.percent').each(function(i){
    $(this).attr('id', `percent_${i}`);
  });
  $('.contents-pacent__box2__graph2').each(function(i){
    $(this).attr('id', `graph_${i}`);
  });
  //idをそれぞれにふる
  (window.onload = function() {
    var ele = document.getElementsByClassName("Achievement");
    for(var i = 0; i < ele.length; i++){
      $("#graph_"+i).css({ 'width' : $( "#percent_"+ i).val() } );
  //Achievementの数を数えてプロジェクト数をカウントしその回数繰り返すようfor文で設定
    };
    });
});

  
    
  