
//inc
$(document).ready (function() {
	$.ajax({
		url : "./../inc/head.html",
		dataType : "html",
		success : function(results) {
			$(results).appendTo('head');
		}
	});
});