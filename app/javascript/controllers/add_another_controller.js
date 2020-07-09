import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "fieldContainer", "blankFields" ]

  addAnother(e){
    e.preventDefault();
    this.fieldContainerTarget.insertAdjacentHTML('beforeend', this.blankFieldsTargets[0].innerHTML)
  }
}