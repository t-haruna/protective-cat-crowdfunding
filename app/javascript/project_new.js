$(function() {
  $('.hidden-field1').on('change',function() {
    $(`.qulick1-1`).addClass("delete1")
    $(`.qulick2-1`).removeClass("delete1")
    $(`.image-box1`).addClass("color")
  ;})

  $('.hidden-field2').on('change',function() {
    $(`.qulick1-2`).addClass("delete2")
    $(`.qulick2-2`).removeClass("delete2")
    $(`.image-box2`).addClass("color")
  ;})

  $('.hidden-field3').on('change',function() {
    $(`.qulick1-3`).addClass("delete3")
    $(`.qulick2-3`).removeClass("delete3")
    $(`.image-box3`).addClass("color")
  ;})

  $('.hidden-field4').on('change',function() {
    $(`.qulick1-4`).addClass("delete4")
    $(`.qulick2-4`).removeClass("delete4")
    $(`.image-box4`).addClass("color")
  ;})

  $('.hidden-field5').on('change',function() {
    $(`.qulick1-5`).addClass("delete5")
    $(`.qulick2-5`).removeClass("delete5")
    $(`.image-box5`).addClass("color")
  ;})
});