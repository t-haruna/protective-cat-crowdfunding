$(function() {
  var $slider  = $('.Phot');
    var $slide   = $slider.children();
    var slideLen = $slide.length;
    $slider.slick({
    autoplay: true,
    autoplaySpeed: 3000,
    pauseOnFocus: false,
    dots: true,
    infinite: false,
    fade: true,
    speed: 1000,
    cssEase: 'linear',
  }).on('afterChange', function(  ){
    //最後のスライドでストップ
    var $self = $(this);
      if((slideLen - 1) <= $self.slick('slickCurrentSlide')){
        //自動再生停止
        $self.slick('slickSetOption', 'autoplay', false);
        //クリックしても再開しないように一時停止設定
        $slider.slick('slickPause');
      }
    //最後のスライドで文字を１文字づつ出現させる
      if($self.slick('slickCurrentSlide') == 2){
      var $allMsg = $('#expect__title__crowdfunding');
      //splitメソッドを使って、文章を１文字づつに分解する
      var $wordList = $('#expect__title__crowdfunding').html().split("");
      $('#expect__title__crowdfunding').html("");
      $.each($wordList, function(idx, elem) {
      //はじめは見えないようにopacityを０にしてあるので1にして見えるようにする
        $('#expect__title__crowdfunding').css({opacity: 1 });
        var newEL = $(`<span/>`).text(elem).css({ opacity: 0 });
        newEL.appendTo($allMsg);
        //文字を浮かび上がらせる時間をdeplayで指定
        newEL.delay(idx * 80);
        newEL.animate({ opacity: 1 }, 1100);
      });
      $('.Start-crowdfunding').delay(2000).queue(function(){
        $(this).addClass('Select');
        $('.select').css({opacity: 1 });
    });
      $('.Understand-crowdfunding').delay(2000).queue(function(){
        $(this).addClass('Select');
        $('.select').css({opacity: 1 });
    });

     }
  });
});







  
