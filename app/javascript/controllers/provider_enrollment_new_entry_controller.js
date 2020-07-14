import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["modal", "openCheckinModal", "eventModalButton"]

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

  toggleOpenCheckinModal(e) {
    this.openCheckinModalTarget.classList.toggle('hidden');
    if (e.currentTarget.hasAttribute('data-event') && e.currentTarget.hasAttribute('data-btnlabel')) {
      this.eventModalButtonTarget.setAttribute('href', `/clinics/${e.currentTarget.dataset.clinic}/queued_patients/update_clinic_status?event=${e.currentTarget.dataset.event}`);
      this.eventModalButtonTarget.textContent = e.currentTarget.dataset.btnlabel;
      document.getElementsByClassName('eventCapitalized')[0].innerHTML = e.currentTarget.dataset.eventcapitalized;
    }
  }
}