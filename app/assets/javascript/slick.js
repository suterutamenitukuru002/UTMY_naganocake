$(document).on('turbolinks:load',function() {
  $('.slider').slick({
      arrows: false,  //ボタン非表示
      autoplay: true, //自動再生
      autoplaySpeed: 2300, //再生スピード
  });
});