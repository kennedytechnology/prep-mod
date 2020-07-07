import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["flashMessage"]

    connect() {
      let flashMessage = document.getElementById("flashMessage");

      flashMessage.classList.add("flash-message-active");
      setTimeout(function() { 
          flashMessage.classList.remove("flash-message-active");
      }, 3000);
    }

    disconnect() {
      let flashMessage = document.getElementById("flashMessage");

      if (flashMessage.classList.contains("flash-message-active")) {
        flashMessage.classList.remove("flash-message-active");
      }
    }
}