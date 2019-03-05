const btn = document.querySelector(".button-open-chat");
const chat = document.querySelector(".message");

const initChat = () => {
  if (btn == null) {
    return
  }

  btn.addEventListener("onClick", (event) => {
    chat.style.display ="";
  });

  btn.addEventListener("click", (event) => {
    chat.classList.toggle("display");
  });
}

export default initChat;



