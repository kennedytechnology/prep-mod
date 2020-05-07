import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {

  }

  toggleModal(event) {
    let modal = document.getElementById("InventoryNewEntryModal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
  }

  updateModalField(e) {
    let currentFieldId = e.currentTarget.id,
      currentFieldValue = e.currentTarget.value;

    document.getElementById("modal_" + currentFieldId).value = currentFieldValue;
  }
}