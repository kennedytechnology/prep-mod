import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "fullName", "signatureInput", "buttonTitle" ]

  connect() {}

  toggleSignature(e) {
    if(this.titleTarget.innerText == "Please sign here with your finger or mouse") {
      this.titleTarget.innerText = "Please type your first and last name";
      this.buttonTitleTarget.innerText = "Sign with my mouse or finger";
      this.signatureInputTarget.classList.add("hidden");
      this.fullNameTarget.classList.remove("hidden");
    } else {
      this.titleTarget.innerText = "Please sign here with your finger or mouse";
      this.buttonTitleTarget.innerText = "Sign by typing my full name";
      this.fullNameTarget.classList.add("hidden");
      this.signatureInputTarget.classList.remove("hidden");
    }
  }
}