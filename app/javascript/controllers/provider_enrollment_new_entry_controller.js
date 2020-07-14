import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {}

  toggleTextArea(e) {
    let currentCheckbox = e.currentTarget,
      currentTextarea = $("[data-textarea='" + e.currentTarget.getAttribute("data-textarea") + "']")[1]

    if (e.currentTarget.checked) {
      $(currentTextarea).val($(currentCheckbox).val());
      $(currentTextarea).text($(currentCheckbox).val());
      $(currentTextarea).addClass("invisible");
    } else {
      $(currentTextarea).val("");
      $(currentTextarea).text("");
      $(currentTextarea).removeClass("invisible");
    }
  }

  setStatus(e) {
    document.getElementById("provider_enrollment_status").value = e.currentTarget.getAttribute("data-status");
  }

  setDeniedStatus(e) {
    let statusField = document.getElementById("provider_enrollment_status");
    statusField.value = "denied";
  }

  toggleModal(e) {
    this.modalTarget.classList.toggle('opacity-0');
    this.modalTarget.classList.toggle('pointer-events-none');
  }
}