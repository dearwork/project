
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
function vhBug() {
	window.addEventListener("resize", function() {
		const vh = window.innerHeight * 0.01;
		document.documentElement.style.setProperty('--vh', `${vh}px`);
	});
}

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

//TIME
function time() {
	let today = new Date();

	let year = today.getFullYear(),
		month = String(today.getMonth() + 1).padStart(2, "0"),
		date = String(today.getDate()).padStart(2, "0"),
		day = String(today.getDay()).padStart(2, "0");

	let hours = String(today.getHours()).padStart(2, "0"),
		min = String(today.getMinutes()).padStart(2, "0"),
		millsecond = String(today.getMilliseconds()).padStart(2, "0");

	var apm = "";
	if (hours < 12) {
		apm = "오전";
		hours;
	}else if(hours == 12) {
		hours;
	}else {
		apm = "오후";
		hours = (hours%12) || 12;
	};

	document.getElementById("apm").innerHTML = apm;
	document.getElementById("num").innerHTML = hours + ":" + min;
	document.getElementById("date").innerHTML = year + "-" + month + "-" + date;

	setInterval(function() {
		document.getElementById("apm").innerHTML = apm;
		document.getElementById("num").innerHTML = hours + ":" + min;
		document.getElementById("date").innerHTML = year + "-" + month + "-" + date;
	},100);
}