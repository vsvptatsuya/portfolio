// JavaScript Document

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-39456180-1']);
_gaq.push(['_setDomainName', 'pointy.jp']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


$(window).load(function() {
  $('.flexslider').flexslider({
	animation: "slide",
	prevText: "",
	nextText: ""
  });
});
jQuery(function($){
  $('a').bind('touchstart', function(){
	  $(this).addClass('hover');
  }).bind('touchend touchmove touchcancel', function(){
	  $(this).removeClass('hover');
  });
});
