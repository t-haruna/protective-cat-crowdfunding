$(function() {
  $('.Phot').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    pauseOnFocus: false,
    dots: true,
    infinite: true,
    fade: true,
    speed: 3000,
    cssEase: 'linear'
  });
});

$('.phot__image').on('beforeChange', function(){
  $('.expect__title__crowdfunding').addClass('fade-in-right');
});