$(function() {
  // $('.hidden-field1').on('change',function() {
  //   $(`.qulick1-1`).addClass("delete1")
  //   $(`.qulick2-1`).removeClass("delete1")
  //   $(`.image-box1`).addClass("color")
  // ;})

  // $('.hidden-field2').on('change',function() {
  //   $(`.qulick1-2`).addClass("delete2")
  //   $(`.qulick2-2`).removeClass("delete2")
  //   $(`.image-box2`).addClass("color")
  // ;})

  // $('.hidden-field3').on('change',function() {
  //   $(`.qulick1-3`).addClass("delete3")
  //   $(`.qulick2-3`).removeClass("delete3")
  //   $(`.image-box3`).addClass("color")
  // ;})

  // $('.hidden-field4').on('change',function() {
  //   $(`.qulick1-4`).addClass("delete4")
  //   $(`.qulick2-4`).removeClass("delete4")
  //   $(`.image-box4`).addClass("color")
  // ;})

  // $('.hidden-field5').on('change',function() {
  //   $(`.qulick1-5`).addClass("delete5")
  //   $(`.qulick2-5`).removeClass("delete5")
  //   $(`.image-box5`).addClass("color")
  // ;})

  $('#input-file').on('change',function() {
    $('.preview-box').remove();
    var file =$(this).prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      console.log(fileReader.result)
      //$('.image-box1').remove();
      $(`#preview`).html(`<img src='' id='preview-box' class='preview-box'/>`)
      var image = fileReader.result
      $(`#preview-box`).attr('src', `${image}`);
      //$(`#preview`).html(`<img src='+ fileReader.result + '/>`)
       $('img').addClass('resize-image');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file2').on('change',function() {
    $('.preview-box2').remove();
    var file =$(this).prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      console.log(fileReader.result)
      //$('.image-box1').remove();
      $(`#preview2`).html(`<img src='' id='preview-box2' class='preview-box2'/>`)
      var image = fileReader.result
      $(`#preview-box2`).attr('src', `${image}`);
      //$(`#preview`).html(`<img src='+ fileReader.result + '/>`)
       $('img').addClass('resize-image');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file3').on('change',function() {
    $('.preview-box3').remove();
    var file =$(this).prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      console.log(fileReader.result)
      //$('.image-box1').remove();
      $(`#preview3`).html(`<img src='' id='preview-box3' class='preview-box3'/>`)
      var image = fileReader.result
      $(`#preview-box3`).attr('src', `${image}`);
      //$(`#preview`).html(`<img src='+ fileReader.result + '/>`)
       $('img').addClass('resize-image');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file4').on('change',function() {
    $('.preview-box4').remove();
    var file =$(this).prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      console.log(fileReader.result)
      //$('.image-box1').remove();
      $(`#preview4`).html(`<img src='' id='preview-box4' class='preview-box4'/>`)
      var image = fileReader.result
      $(`#preview-box4`).attr('src', `${image}`);
      //$(`#preview`).html(`<img src='+ fileReader.result + '/>`)
       $('img').addClass('resize-image');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file5').on('change',function() {
    $('.preview-box5').remove();
    var file =$(this).prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      console.log(fileReader.result)
      //$('.image-box1').remove();
      $(`#preview5`).html(`<img src='' id='preview-box5' class='preview-box5'/>`)
      var image = fileReader.result
      $(`#preview-box5`).attr('src', `${image}`);
      //$(`#preview`).html(`<img src='+ fileReader.result + '/>`)
       $('img').addClass('resize-image');
    }
    fileReader.readAsDataURL(file);
  });
});


