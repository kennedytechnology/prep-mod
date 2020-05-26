import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "field" ]

  applyValues(event) {
    if(event.target.checked){
      [...this.fieldTargets].forEach(element => element.value = element.dataset.parentField);
    } else {
      [...this.fieldTargets].forEach(element => element.value = "");
    }
  }

}
