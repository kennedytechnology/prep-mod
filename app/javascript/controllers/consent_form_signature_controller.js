import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "title", "fullName", "signatureInput", "buttonTitle" ]

  connect() {
    // if (this.hasSignatureInputTarget) {
    //   document.getElementById("submitButton").addEventListener("mouseover", function(event){ 

    //   });

    //   document.getElementById("submitButton").addEventListener("mouseover", function(event){
    //     let firstName = document.getElementById("patient_signatory_first_name"),
    //         lastName = document.getElementById("patient_signatory_last_name"),
    //         signature = document.getElementById("hidden_signature_data"),
    //         submitButton = document.getElementById("submitButton"),
    //         errorMessage = document.getElementById("signatureErrorMessage")

    //     // Check if consent statements is signed
    //     if ( ( (firstName.value == "") || (lastName.value == "") ) ||
    //         ( (signature.length == 0) || (signature.value == "") || (signature.getAttribute("src") == "") ) ) {
    //         submitButton.setAttribute("disabled", "disabled");
    //         errorMessage.classList.remove("hidden");
    //     } else {
    //       submitButton.removeAttribute("disabled");
    //       errorMessage.classList.add("hidden");
    //     }

    //     // Check if at least one checkbox is checked



    //   });
    // }
  }

  isFullNameEntered(first_name, last_name) {
    if ( (firstName == "") || (last_name == "") ) {
      return false;
    } else { return true; }
  }

  isSignatureEntered(signature) {
    if ( (signature.length == 0) || (signature.value == "") || (signature.getAttribute("src") == "") ) {
      return false;
    } else { return true; }
  }

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