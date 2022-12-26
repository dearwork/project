

// tab 이동
function tabLink() {
	$(".tab_wrap li").click(function() {
		var tabId = $(this).index();

		$(this).addClass("on");
		$(this).siblings().removeClass("on");

		$(".menu_section").removeClass("all");
		$(".menu_section").eq(tabId - 1).addClass("on").siblings(".menu_section").removeClass("on");
		if($(this).hasClass("all")){
			$(".menu_section").addClass("all");
			$(".menu_cont").removeClass("on");
		}
	});
	$(".tab_wrap li:first-child").click();
}

function moreDetail() {
	$(".comment .more_detail").click(function() {
		var strong = $(this),
			divParent = strong.closest(".more_detail");

		if(divParent.hasClass("open")){
			divParent.removeClass("open")
		}else {
			divParent.addClass("open");
		}
	})
}
