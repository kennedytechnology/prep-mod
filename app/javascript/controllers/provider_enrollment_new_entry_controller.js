import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []

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
    let statusField = document.getElementById("provider_enrollment_status");
    statusField.value = e.target.value.split(' ').join('_').toLowerCase();
  }
}