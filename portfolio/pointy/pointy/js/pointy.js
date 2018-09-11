// JavaScript Document// JavaScript Document
// for IE
/*
jQuery(function() {
    if(navigator.userAgent.indexOf("MSIE") != -1) {
        jQuery('img').each(function() {
            if(jQuery(this).attr('src').indexOf('.png') != -1) {
                jQuery(this).css({
                    'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(src="' + jQuery(this).attr('src') + '", sizingMethod="scale");'
                });
            }
        });
    }
});
*/
$(document).ready(function(){
	var buttons = { previous:$('#jslidernews2 .button-previous') ,
						next:$('#jslidernews2 .button-next') };			 
		$('#jslidernews2').lofJSidernews( { interval:5000,
											 	easing:'easeInOutQuad',
												duration:1200,
												auto:true,
												mainWidth:740,
												mainHeight:388,
												navigatorHeight		: 80,
												navigatorWidth		: 200,
												maxItemDisplay:3,
												buttons:buttons } );
	
	$(".hover").hover(function(){
	//↑.hover_imgはアニメーションを付けたい要素を指定。
		 $(this).stop().fadeTo(300,0.5);
					  //↑ここでの設定はカーソルを乗せたときの動き
			 　　　//最初の指定でスピード指定、二番目の指定で透明度の指定
		},
		function(){
		$(this).stop().fadeTo(300,1.0);
					  //↑ここでの設定はカーソルが離れたときの動き
			 　　　//最初の指定でスピード指定、二番目の指定で透明度の指定
		});
	
	$(function(){
		$('a[href^=#]').click(function(){
			var speed = 1000;
			var href= $(this).attr("href");
			var target = $(href == "#" || href == "" ? 'html' : href);
			var position = target.offset().top;
			$("html, body").animate({scrollTop:position}, speed, "swing");
			return false;
		});
	});

});
	//use
	$(function(){
		$("#use .useInner").hide();
		$('.useBtn').click(function() {
			$(this).toggleClass("open");
			$("#use .useInner").stop().slideToggle();
			return false;
		});
	});

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-39456180-1']);
  _gaq.push(['_setDomainName', 'pointy.jp']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();



