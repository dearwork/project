jQuery(function($){

    /*toggle*/
    let btn = document.querySelector("#toggleBTN");
    let sidebar = document.querySelector(".navgation");
    
    btn.onclick = function() {
        sidebar.classList.toggle("active");
    };

    /* submenu*/
    let contents_title = document.querySelector("#contents");
    let com_title = document.querySelector("#community");
    let contents_submenu = document.querySelector(".contents_submenu");
    let com_submenu = document.querySelector(".com_submenu");

    contents_title.onclick = function() {
        contents_submenu.classList.toggle("subactive");
    };
    com_title.onclick = function() {
        com_submenu.classList.toggle("subactive");
    };
    
});