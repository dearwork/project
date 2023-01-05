
//inc
// $(document).ready (function() {
// 	$.ajax({
// 		url : "./../inc/head.html",
// 		dataType : "html",
// 		success : function(results) {
// 			$(results).appendTo('head');
// 		}
// 	});
// });

//vh 단위 버그 해결법
window.addEventListener("resize", function() {
	const vh = window.innerHeight * 0.01;
	document.documentElement.style.setProperty('--vh', `${vh}px`);
});

// 한 세션씩 이동하기
function sectionMove() {
	const elm = document.querySelectorAll('section');
	const elmCount = elm.length;

	elm.forEach(function(item, index){
        item.addEventListener('mousewheel', function(event){
			event.preventDefault();
			let delta = 0;

			if (!event) event = window.event;
			if (event.wheelDelta) {
				delta = event.wheelDelta / 120;
				if (window.opera) delta = -delta;
			} 
			else if (event.detail)
				delta = -event.detail / 3;

			let moveTop = window.scrollY;
			let elmSelector = elm[index];

          // wheel down : move to next section
			if (delta < 0){
            if (elmSelector !== elmCount-1){
				try{
					moveTop = window.pageYOffset + elmSelector.nextElementSibling.getBoundingClientRect().top;
				}catch(e){}
            }
		}
          // wheel up : move to previous section
		else{
            if (elmSelector !== 0){
				try{
                moveTop = window.pageYOffset + elmSelector.previousElementSibling.getBoundingClientRect().top;
				}catch(e){}
            }
		}

		const body = document.querySelector('html');
			window.scrollTo({top:moveTop, left:0, behavior:'smooth'});
        });
	});
};

