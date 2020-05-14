import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["locationsCheckboxes"]

  connect() {

  }

  showCheckboxes() {
    this.locationsCheckboxesTarget.classList.toggle("active");
  }
}