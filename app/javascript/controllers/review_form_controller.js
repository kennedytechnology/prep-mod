import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["form", "modal", "modalForDenied", "modalContent", "submitButton", "validates"]

  connect() {
    this.onDisableFormPage();
  }

  openModal(event) {
    this.modalTarget.classList.remove('opacity-0');
    this.modalTarget.classList.remove('pointer-events-none');
  }

  onDisableFormPage() {	
    let isValid = true;	

    this.validatesTargets.forEach((e) => {	
      if (e.value === "") {	
        isValid = false;	
        return isValid;	
      }	
    });	

    if (isValid) this.submitButtonTarget.removeAttribute('disabled');	
    else this.submitButtonTarget.setAttribute('disabled', true);	
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

  closeDeniedModal(event) {
    this.modalForDeniedTarget.classList.add('opacity-0');
    this.modalForDeniedTarget.classList.add('pointer-events-none');
  }

  submitForm(event) {
    let reviewedField = document.getElementById("reviewed_form_hidden_tag");

    reviewedField.value = true;

    this.formTarget.submit();
    this.closeModal();
  }

  submitInventoryForm(event) {
    let reviewedField = document.getElementById("reviewed_form_hidden_tag"),
        statusField = document.getElementById("provider_enrollment_status");

    reviewedField.value = true;
    statusField.value = event.currentTarget.value || "pending";

    this.closeModal();

    if (statusField.value == "denied") {
      this.openDeniedModal();
    } else {
      this.formTarget.submit();
    }
  }

}