$('head').append(
	'<style type="text/css">#container { display: none; } #fade, #loader { display: block; }</style>'
);

jQuery.event.add(window,"load",function() { // ‘S‚Ä‚Ì“Ç‚İ‚İŠ®—¹Œã‚ÉŒÄ‚Î‚ê‚éŠÖ”
	var pageH = $("#container").height();

	$("#fade").css("height", pageH).delay(900).fadeOut(800);
	$("#loader").delay(600).fadeOut(300);
	$("#container").css("display", "block");
});