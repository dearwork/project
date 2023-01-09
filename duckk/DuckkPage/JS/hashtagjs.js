window.onload = () => {
    const tagContainer = document.querySelector('.tag_container');
    const input = document.querySelector('.tag_container input');
    const name = input.innerText;

    let tags = [];

    function createTag(label) {
        const div = document.createElement('div');
        div.setAttribute('class','tag');
        const span = document.createElement('span');
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

    input.focus();
}
