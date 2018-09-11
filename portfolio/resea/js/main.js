// JavaScript Document
$(function(){
	
	$('.nav').flashyNav({
		rolloverColor: '#00d2ff',	//the default color of the rollover element
		rolloverDuration: 500,	//the default duration for the rollover
		easingMethod: 'easeInOutQuint'	//easing method used for animation
	});

});

$(function() {
	var topBtn = $('#page-top');	
	topBtn.hide();
	//スクロールが100に達したらボタン表示
	$(window).scroll(function () {
		if ($(this).scrollTop() > 150) {
			topBtn.fadeIn();
		} else {
			topBtn.fadeOut();
		}
	});
	//スクロールしてトップ
    topBtn.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
    });
});

$(document).ready(
  function(){
    $("a img").hover(function(){
       $(this).fadeTo("normal", 0.5); // マウスオーバーで透明度を50%にする
    },function(){
       $(this).fadeTo("normal", 1.0); // マウスアウトで透明度を100%に戻す
    });
  });