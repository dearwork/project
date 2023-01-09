window.onload = () => {
    //폰트스타일효과
    const buttons = document.querySelectorAll('button');
    textField.document.designMode="on";
    let show = false;
    for(let i=0; i < buttons.length; i++) {
        buttons[i].addEventListener('click', () => {
            let cmd = buttons[i].getAttribute('data-command');
            if(buttons[i].name === "active") {
                buttons[i].classList.toggle('active');
            }
            if( cmd === 'insertImage' || cmd === 'createLink') {
                let url = prompt('Enter link here:','');
                textField.document.execCommand(cmd, false, url);
                if(cmd === 'inserImage') {
                    const imgs = textField.document.querySelectorAll('img');
                    imgs.forEach(item => {
                        item.style.maxWidth = "500px";
                    });
                }else {
                    const links = textField.document.querySelectorAll('a');
                    links.forEach(item => {
                        item.target = "_blank";
                        item.addEventListener('mouseover', () => {
                            textField.document.designMode ="off";
                        });
                        
                        item.addEventListener('mouseout', () => {
                            textField.document.designMode ="on";
                        });
                    })
                }

            }else{
                textField.document.execCommand(cmd, false, null);
            }
            if( cmd === "showCode"){
                const textbody = textField.document.querySelector('body');
                if(show){
                    textbody.innerHTML = textbody.textContent;
                    show = false;
                }else {
                    textbody.textContent = textbody.innerHTML;
                    show = true;
                }
            }

        })
    }

    //header
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
            arrowParent.classList.toggle("showMenu");
        });
    }
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".bx-menu");
    console.log(sidebarBtn);
    sidebarBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
    });

    //텍스트

     //실시간 값 감지
    var otherT = '';
    var otherTBTN = '';
     //기타 값
    $('.othertextcheckboxtext').on('propertychange change keyup paste input', function() {
        otherT = $(this).val();
        $('.othertext').text(otherT);
        return 0;
    });
    //textarea 자동길이
    $('textarea#title').css('height','30px');
    $('textarea#title').on('keydown', function () {
        $(this).height(1).height($(this).prop('scrollHeight')-20);
    });
    $('textarea#subtitle').css('height','20px');
    $('textarea#subtitle').on('keydown', function () {
        $(this).height(1).height($(this).prop('scrollHeight')-10);
    });
    $('textarea#contents').css('height','300px');
    $('textarea#contents').on('keydown', function () {
        $(this).height(1).height($(this).prop('scrollHeight')+10);
    });
    $('textarea#title').on('keydown', function () {
        if(event.keyCode === 13) {
            event.preventDefault();
        }
    });
    $('textarea#subtitle').on('keydown', function () {
        if(event.keyCode === 13) {
            event.preventDefault();
        }
    });

    //해시태그
    /*
    const tagContainer = document.querySelector('.tag_container');
    const input = document.querySelector('.tag_container input');
    const name = input.innerText;

    let tags = [];

    function createTag(label) {
        const div = document.createElement('div');
        div.setAttribute('class','tag');
        const span = document.createElement('span');
        span.setAttribute('name', 'tag');
        span.setAttribute('class', 'tagSpan');
        span.setAttribute('value', label);
        span.innerHTML = label;
        const closeBTN = document.createElement('i');
        closeBTN.setAttribute('class','material-icons');
        closeBTN.setAttribute('data-item', label);
        closeBTN.innerHTML = 'close';

        div.appendChild(span);
        div.appendChild(closeBTN);
        return div;
    }

    function reset() {
        document.querySelectorAll('.tag').forEach(function(tag) {
            tag.parentElement.removeChild(tag);
        })
    }

    function addTags() {
        reset();
        tags.slice().reverse().forEach(function(tag) {
            const input = createTag(tag);
            tagContainer.prepend(input);
        })
    }

    input.addEventListener('keyup', function(e) {
        if(input.value != ''){
            if(e.key === 'Enter') {
                tags.push(input.value);
                addTags();
                input.value = '';
            }
            if(e.keycode == 13 ) {
                tags.push(input.value);
                addTags();
                input.value = '';
            }
        }
    })

    document.addEventListener('click', function(e) {
        if(e.target.tagName ==='I') {
            console.log(e.target.tagName);
            const value = e.target.getAttribute('data-item');
            const index = tags.indexOf(value);
            tags = [...tags.slice(0, index), ...tags.slice(index + 1)];
            addTags();
        }
    })

    function handleClick(e){
        if(e.target.classList.contains("save")) {
            fetch("url", {
                method: "POST",
                headers: {"Content-Type":"application/json"},
                body: JSON.stringify({
                    keyword: tags
                })
            })
            .then(response => {
                return response.json();
            })
            .then(data => {
                console.log(data);
            })
            .catch(err => {
                console.log("Error :-S",err);
            });
        }
    }

    input.focus();*/
}