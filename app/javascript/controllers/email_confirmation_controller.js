import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "emailField", "confirmEmailField", "confirmEmailError" ]

  connect() {
  }

  emailConfirmation() {
    if ((this.emailFieldTarget.value != this.confirmEmailFieldTarget.value)
      || this.emailFieldTarget.value == "" || this.confirmEmailFieldTarget.value == "") {
      this.confirmEmailErrorTarget.innerText = "Emails don't match!";
      document.getElementById("submitButton").setAttribute("disabled", "true");
    } else {
      this.confirmEmailErrorTarget.innerText = "";
      document.getElementById("submitButton").removeAttribute("disabled");
    }
  }
}