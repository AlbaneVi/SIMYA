btn = document.querySelector(".button-open-chat");
chat = document.querySelector(".message");

btn.addEventListener("onClick", (event) => {
    chat.style.display ="";
  });

btn.addEventListener("click", (event) => {
    chat.classList.toggle("display");
  });
