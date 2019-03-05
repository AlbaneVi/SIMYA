btn = document.querySelector(".button-open-chat");
chat = document.querySelector(".message");
messages = document.querySelector(".message-user");

btn.addEventListener("onClick", (event) => {
    chat.style.display ="";
});

btn.addEventListener("click", (event) => {
    chat.classList.toggle("display");
    // put scroll messages to bottom
    messages.scrollTop = messages.scrollollHeight - messages.clientHeight;
});

