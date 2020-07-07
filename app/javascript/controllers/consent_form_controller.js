import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "searchableRow", "employer", "locations", 
      "companyCheckbox", "companyInputField", "locationsCheckboxes", "otherReasonExplanation",
      "emailField", "confirmEmailField", "confirmEmailError" ]

  connect() {
    $(document).click(function (e) {
      if ( e.target.id != "predict_company_name" && !$("#locationsCheckboxes").find(e.target).length ) {
        $("#locationsCheckboxes").removeClass("active");
      }
    });

    if ((this.hasOtherReasonExplanationTarget) && (document.getElementById("patient_has_other_reason_true").checked)) {
      this.otherReasonExplanationTarget.classList.remove("hidden");
    }
  }

  showCheckboxes() {
    this.locationsCheckboxesTarget.classList.toggle("active");
  }

  search(event) {
    let searchTerm = event.target.value.toLowerCase()
    this.searchableRowTargets.forEach((el, i) => {
      let filterableKey =  el.getAttribute("data-search-content")
      el.classList.toggle("hidden", !filterableKey.includes( searchTerm ) )
    })
  }

  displayLocations(e) {
    if (e.currentTarget.checked) {
      this.toggleModal(e);
      this.employerTarget.innerText = e.currentTarget.getAttribute("data-employer");
      this.locationsTarget.innerText = e.currentTarget.getAttribute("data-locations");
    }

    this.companyInputFieldTarget.innerHTML = "Selected: <br/>" + this.companyCheckboxTargets.filter(e => e.checked).map(e => e.dataset.employer).join("<br/> ")
  }

  toggleModal(event) {
    let modal = document.getElementById("businessLocationsModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }

  showOtherReasonExplanation() {
    this.otherReasonExplanationTarget.classList.remove("hidden");
  }

  hideOtherReasonExplanation() {
    this.otherReasonExplanationTarget.classList.add("hidden");
    document.getElementById("patient_has_other_reason_explanation").value = "";
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