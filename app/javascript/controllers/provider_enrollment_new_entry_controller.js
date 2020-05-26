import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = []

  connect() {}

  toggleTextArea(e) {
    let currentCheckbox = e.currentTarget,
      currentTextarea = $("[data-textarea='" + e.currentTarget.getAttribute("data-textarea") + "']")[1]

    if (e.currentTarget.checked) {
      $(currentTextarea).val($(currentCheckbox).val());
      $(currentTextarea).text($(currentCheckbox).val());
      $(currentTextarea).addClass("hidden");
    } else {
      $(currentTextarea).val("");
      $(currentTextarea).text("");
      $(currentTextarea).removeClass("hidden");
    }
  }
}