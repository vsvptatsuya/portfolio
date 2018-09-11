
// JavaScript Document
<!--スクロールしたら出てくるボタン-->
$(function() {
	$(window).scroll(function () {
		var s = $(this).scrollTop();
		var m = 800;
		var n = 1500;
		if(s > m) {
			$("#profile").fadeIn('slow');
		} else if(s < m) {
			$("#profile").fadeOut('slow');
		}
		if(s > n) {
			$("#sns").animate({left: 0},{duration: 'fast', easing: 'linear'});
		} else if(s < n) {
			$("#sns").animate({left: -320},{duration: 'fast', easing: 'linear'});
		}
	});
});


