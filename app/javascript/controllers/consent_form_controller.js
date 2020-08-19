import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "searchableRow", "employer", "locations",
      "companyCheckbox", "companyInputField", "locationsCheckboxes", "hasOtherReason", "otherReasonExplanation", "otherReasonExplanationArea",
      "emailField", "confirmEmailField", "confirmEmailError" ]

  connect() {
    $(document).click(function (e) {
      if ( e.target.id != "predict_company_name" && !$("#locationsCheckboxes").find(e.target).length ) {
        $("#locationsCheckboxes").removeClass("active");
      }
    });

    var that = this;
    if (this.hasOtherReasonTargets) {
      that.toggleHasOtherReasonBox();
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
    if (e.currentTarget.checked && e.currentTarget.dataset.type === "employer") {
      this.toggleModal(e);
      this.employerTarget.innerText = e.currentTarget.getAttribute("data-employer");
      this.locationsTarget.innerText = e.currentTarget.getAttribute("data-locations");
    }

    this.companyInputFieldTarget.innerHTML = "<b>Selected:</b> <br/>" + this.companyCheckboxTargets.filter(e => e.checked).map(e => e.dataset.employer).join("<br/> ")
  }

  toggleModal(event) {
    let modal = document.getElementById("businessLocationsModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }

  toggleHasOtherReasonBox() {
    let that = this;
    
    this.hasOtherReasonTargets.forEach((item, index) => {
      if (item.checked && item.value === "true") {
        that.otherReasonExplanationTargets[index].classList.remove("hidden")
      } else {
        that.otherReasonExplanationTargets[index].classList.add("hidden")
        that.otherReasonExplanationAreaTargets[index].value = "";
      }
    })
  }
}
