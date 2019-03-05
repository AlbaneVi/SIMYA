
const btn = document.querySelector(".button-open-chat");
const chat = document.querySelector(".message");
const close = document.querySelector(".btn-close-chat");


const initChat = () => {
  if (btn == null) {
    return
  }

  btn.addEventListener("click", (event) => {
    chat.style.display ="";
});

  btn.addEventListener("click", (event) => {
    chat.classList.toggle("display");
    btn.style.display = "none";

  });

  close.addEventListener("click", (event) => {
    chat.classList.toggle("display");
    btn.style.display = "";
  })

}

export default initChat;






