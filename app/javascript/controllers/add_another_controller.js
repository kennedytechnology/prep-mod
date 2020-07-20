import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "fieldContainer", "blankFields" ]

  addAnother(e){
    e.preventDefault();
    
    if(this.blankFieldsTargets[0].getElementsByTagName("input").length > 1){
      this.blankFieldsTargets[0].getElementsByTagName("input")[1].remove()
    }
    this.fieldContainerTarget.insertAdjacentHTML('beforeend', this.blankFieldsTargets[0].innerHTML)
  }
}