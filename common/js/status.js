

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

// quickmenu - 스와이프
function menuSwiper(){
	var quickMenuSlider = new Swiper(".quick_menu", {
		direction : 'horizontal',
		loop : false,
		slidesPerView: 'auto',
		preventClicks: true,
		preventClicksPropagation: false,
		observer: true,
		observeParents: true,
		roundLengths: true,
		variableWidth: true
	});
}
// 퀵메뉴 scroll
function quickSeolMenu(){ 

	$('.quick_menu').css({'top': 0});

	$(document).on('scroll', onScroll);

	$('.quick_menu a').on('click', function (e) {
		e.preventDefault();
		$(document).off("scroll");
		
		$('.quick_menu a').each(function () {
			$(this).parent('.quick_menu li').removeClass('on');
		});
		$(this).parent('.quick_menu li').addClass('on');
		var navheight = $('.quick_menu').outerHeight();
		var target = this.hash;
		$target = $(target);
		$('html, body').stop().animate({
			'scrollTop': $target.offset().top - navheight 
		}, 600, 'swing', function () {
			$(document).on('scroll', onScroll);
		});

		moveTab();
	});

	function onScroll(event) {
		var scrollPos = $(document).scrollTop();
		var navheight = $('.quick_menu').outerHeight();

		$('.quick_menu').css({'top': 0});

		$('.quick_menu a').each(function () {
			var currLink = $(this);
			var refElement = $(currLink.attr('href'));
			if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
				$('.quick_menu ul li').removeClass('on');
				currLink.parent('.quick_menu li').addClass('on').siblings('li').removeClass('on');
				moveTab();
			} else {
				currLink.parent('.quick_menu li').prevUntil('on');
			}
		});
	}
	}

function moveTab(){
	$(".quick_menu > ul > li").each(function(){
		if($(this).hasClass("on") === true){
			var target = $(this);
			scCenter(target);
		}
	});

	// 클릭요소 중앙정렬
	function scCenter(target){
		var quickWrap = $('.quick_menu .swiper-wrapper');
		var targetPos = target.position();
		var boxWidth = $('.quick_menu').width();
		var wrapWidth = 0;
		var selectTargetPos = targetPos.left + target.outerWidth()/2;
		var pos;
		
		quickWrap.find('.swiper-slide').each(function(){ 
			wrapWidth += $(this).outerWidth(); 
		})
		
		if (selectTargetPos <= boxWidth/2)  {
			pos = 0;
		} else if (wrapWidth - selectTargetPos <= boxWidth/2) {
			pos = wrapWidth - boxWidth;
		} else {
			pos = targetPos.left - (boxWidth/2) + (target.outerWidth()/2) +25;
		}

		if(wrapWidth > boxWidth) {
			setTimeout(function(){
				quickWrap.css({
				"transform": "translate3d("+ (pos*-1 -15) +"px, 0, 0)",
				"transition-duration": "300ms"
			})
		}, 200);
		};
	};
};
