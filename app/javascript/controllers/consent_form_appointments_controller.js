import { Controller } from "stimulus";

export default class extends Controller {
  getAppointmentTimeInputs() {
    return document.getElementsByName("appointment[appointment_at]");
  }
  getWaitingListInput() {
    return document.getElementsByName("appointment[on_waiting_list]")[0];
  }

  validateAppointmentTimeInputs() {
    let appointmentTimeInputs = this.getAppointmentTimeInputs();
    let waitingListInput = this.getWaitingListInput();

    if (waitingListInput.checked == true) {
      for (let i = 0; i < appointmentTimeInputs.length; i++) {
        appointmentTimeInputs[i].removeAttribute("required");
        appointmentTimeInputs[i].checked = false;
      }
    }
  }

  validateWaitingList() {
    let waitingListInput = this.getWaitingListInput();

    if (waitingListInput.checked == true) {
      waitingListInput.removeAttribute("required");
      waitingListInput.checked = false;
    }
  }
}
