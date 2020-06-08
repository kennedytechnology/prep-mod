import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["form", "modal", "modalContent"]

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

    submitForm(event) {
      let hiddenField = document.getElementById("reviewed_form_hidden_tag")
      hiddenField.value = true;
      this.closeModal();
      this.formTarget.submit();
    }
}
