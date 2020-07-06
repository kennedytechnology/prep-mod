import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "fullName", "signatureInput", "buttonTitle" ]

  connect() {}

  toggleSignature(e) {
    if(this.titleTarget.innerText == "Please sign here with your finger or mouse") {
      this.titleTarget.innerText = "Please type your first and last name";
      this.buttonTitleTarget.innerText = "Type Your Full Name";
      this.signatureInputTarget.classList.add("hidden");
      this.fullNameTarget.classList.remove("hidden");
    } else {
      this.titleTarget.innerText = "Please sign here with your finger or mouse";
      this.buttonTitleTarget.innerText = "Sign My Name";
      this.fullNameTarget.classList.add("hidden");
      this.signatureInputTarget.classList.remove("hidden");
    }
  }
}