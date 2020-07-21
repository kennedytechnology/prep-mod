import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["flashMessage"]

    connect() {
      let flashMessage = document.getElementById("flashMessage");

      flashMessage.classList.add("flash-message-modal-active");
      setTimeout(function() { 
        flashMessage.classList.remove("flash-message-modal-active");
        flashMessage.remove();
      }, 4500);
    }

    disconnect() {
      let flashMessage = document.getElementById("flashMessage");

      if (flashMessage.classList.contains("flash-message-modal-active")) {
        flashMessage.classList.remove("flash-message-modal-active");
        flashMessage.remove();
      }
    }
}