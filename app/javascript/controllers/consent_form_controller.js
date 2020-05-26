import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "searchableRow", "employer", "locations", "companyCheckbox", "companyInputField" ]

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

    this.companyInputFieldTarget.innerHTML = "Selected: " + this.companyCheckboxTargets.filter(e => e.checked).map(e => e.dataset.employer).join(", ")
  }

  toggleModal(event) {
    let modal = document.getElementById("businessLocationsModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }
}