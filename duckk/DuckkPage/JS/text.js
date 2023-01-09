const elements = document.querySelectorAll('.tool--btn');

        //Event
        elements.forEach(element => {
            element.addEventListenter('click', () => {
                let command = element.dataset['element'];
                document.execCommand(command, false, null);

            })
        })

const buttons = document.querySelectorAll('button');
textField.document.designMode="on";
let show = false;
for(let i=0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', () => {
        let cmd = buttons[i].getAttribute('data-element');
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