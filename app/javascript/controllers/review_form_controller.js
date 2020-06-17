import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["form", "modal", "modalForDenied", "modalContent"]

  connect() {

  }

  openModal(event) {
    this.modalTarget.classList.remove('opacity-0');
    this.modalTarget.classList.remove('pointer-events-none');
  }

  closeModal(event) {
    this.modalTarget.classList.add('opacity-0');
    this.modalTarget.classList.add('pointer-events-none');
    this.modalContentTarget.innerHTML = "";
  }

  openDeniedModal(event) {
    this.modalForDeniedTarget.classList.remove('opacity-0');
    this.modalForDeniedTarget.classList.remove('pointer-events-none');
  }

  submitForm(event) {
    let reviewedField = document.getElementById("reviewed_form_hidden_tag");
    let statusField = document.getElementById("provider_enrollment_status");
    reviewedField.value = true;
    statusField.value = event.currentTarget.value || "pending";
    this.closeModal();
    this.formTarget.submit();
  }

}