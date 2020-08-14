import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "fullName", "signatureInput", "buttonTitle" ]

  connect() {}

  toggleSignature(e) {
    if(this.fullNameTarget.classList.contains("hidden")) {
      this.titleTarget.innerText = "Please type your first and last name";
      this.buttonTitleTarget.innerText = "Sign My Name";
      this.signatureInputTarget.classList.add("hidden");
      this.fullNameTarget.classList.remove("hidden");
    } else {
      this.titleTarget.innerText = "Please sign here with your finger or mouse ";
      this.buttonTitleTarget.innerText = "Type Your Full Name";
      this.fullNameTarget.classList.add("hidden");
      this.signatureInputTarget.classList.remove("hidden");
    }
  }

  onRemoveFamilyMember(e) {
    let memberObjectId = document.getElementsByClassName(`member-${e.currentTarget.dataset.member}`)[0],
        requiredFields = memberObjectId.querySelectorAll("[required]");

    memberObjectId.querySelector("input[type=hidden]").value = "true";
    memberObjectId.style.display = "none";

    for( let i = 0 ; i < requiredFields.length; i++ ) {
      requiredFields[i].required = false;
    }
  }
}