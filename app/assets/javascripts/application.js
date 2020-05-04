// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require_tree .

$(function(){
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        if($("#img_prev").prop("tagName") == 'div'){
          var html = `<img src="${e.target.result}" width="300" height="200">`
          $('#img-prev').append(html);
        }else{
          //src属性を書き換える
          $('#img-prev').attr('src', e.target.result);
        }
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_img").change(function(){
    readURL(this);
  });
})

$(function() {
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
      }, 800);
      return false;
  });
});

$(function() {
  $('#comment-form button').on('click',function(){
    $('body, html').animate({
      scrollTop: $(document).height()
      }, 1500);
      return false;
  });
});
