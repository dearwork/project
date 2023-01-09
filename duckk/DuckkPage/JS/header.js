
		jQuery(function($){
				function navigo (){
				    const header = document.querySelector('header');
				    const headerheight = header.clientHeight;
				    document.addEventListener('scroll', onScroll, { passive: true });
				    function onScroll () {
				        const scrollposition = pageYOffset;
				        const nav = document.querySelector('nav');
				        if (headerheight<=scrollposition){
				        nav.classList.add('fix')
				        }
				        else {
				        nav.classList.remove('fix');
				        }
				    } 
				        
				}
				navigo()
});