$(function() {
  
  $('#input-file').on('change',function() {
    $('.resize-image1').remove();
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
       $('img').addClass('resize-image1');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file2').on('change',function() {
    $('.resize-image2').remove();
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
       $('img').addClass('resize-image2');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file3').on('change',function() {
    $('.resize-image3').remove();
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
       $('img').addClass('resize-image3');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file4').on('change',function() {
    $('.resize-image4').remove();
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
       $('img').addClass('resize-image4');
    }
    fileReader.readAsDataURL(file);
  });

  $('#input-file5').on('change',function() {
    $('.resize-image5').remove();
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
       $('img').addClass('resize-image5');
    }
    fileReader.readAsDataURL(file);
  });

    
});


