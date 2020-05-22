import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["modal", "employer", "locations"]

  connect() {

  }

  toggleModal(event) {
    let modal = document.getElementById("InventoryNewEntryModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }

  toggleUpdateModal(event) {
    let modal = document.getElementById("InventoryUpdateEntryModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }

  updateModalField(e) {
    let currentFieldId = e.currentTarget.id,
      currentFieldValue = e.currentTarget.value;

    document.getElementById("modal_" + currentFieldId).value = currentFieldValue;
  }

  updateModalCheckboxField(e) {
    let currentFieldId = e.currentTarget.id;

    if (e.currentTarget.checked) {
      document.getElementById("modal_" + currentFieldId).checked = true;
    } else {
      document.getElementById("modal_" + currentFieldId).checked = false;
    }
  }

  displayLocations(e) {

    if (e.currentTarget.checked) {
      this.toggleModal(e);
      this.employerTarget.innerText = e.currentTarget.getAttribute("data-employer");
      this.locationsTarget.innerText = e.currentTarget.getAttribute("data-locations");
    }
  }

  toggleModal(event) {
    let modal = document.getElementById("businessLocationsModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }
}