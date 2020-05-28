import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["removeButton", "submitButton", "selectFileInput"];

  showRemoveButton(event) {
    if (event.currentTarget.value != "") {
      this.removeButtonTarget.classList.remove("hidden");
      this.submitButtonTarget.classList.remove("hidden");
    }
  }

  removeUploadedFile() {
    this.selectFileInputTarget.value = "";
    this.removeButtonTarget.classList.add("hidden");
    this.submitButtonTarget.classList.add("hidden");
  }
}
