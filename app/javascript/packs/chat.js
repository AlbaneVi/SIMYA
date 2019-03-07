
const btn = document.querySelector(".button-open-chat");
const chat = document.querySelector(".message");
const close = document.querySelector(".btn-close-chat");
// const open = docuement.querySelector(".message");


const initChat = () => {
  if (btn == null) {
    return
  }

  btn.addEventListener("click", (event) => {
    chat.style.display ="";
});

function scrollToBottom() {
  const objDiv = document.querySelector(".message-user");
  objDiv.scrollTop = objDiv.scrollHeight;
}

  btn.addEventListener("click", (event) => {
    chat.classList.toggle("display");
    btn.style.display = "none";
    scrollToBottom();
  });

  close.addEventListener("click", (event) => {
    chat.classList.toggle("display");
    btn.style.display = "";
  })

  // open.addEventListener("message", (event) => {
  //   chat.classList.toggle("display");
  //   btn.style.display = "";
  // }

}

export default initChat;






