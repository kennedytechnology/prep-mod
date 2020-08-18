import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["onWaitingList", "appointmentAt"];

  validateWaitingList() {
    this.onWaitingListTarget.removeAttribute("required");
    this.onWaitingListTarget.checked = false;

    this.appointmentAtTargets.forEach((element) => {
      element.setAttribute("required", true);
    });
  }

  validateAppointmentTimeInputs() {
    this.appointmentAtTargets.forEach((element) => {
      element.removeAttribute("required");
      element.checked = false;
    });

    this.onWaitingListTarget.setAttribute("required", true);
  }
}