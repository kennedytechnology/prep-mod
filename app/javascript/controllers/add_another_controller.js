import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "fieldContainer", "blankFields" ]

  addAnother(e){
    this.fieldContainerTarget.insertAdjacentHTML('beforeend', this.blankFieldsTarget.innerHTML)
    e.preventDefault();
  }
}