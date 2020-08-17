import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "requiredCheckbox" ]

  connect() {
    this.update();
  }

  update(){
    var checkedCheckboxes = this.requiredCheckboxTargets.filter(function(el){return el.checked})
    if(checkedCheckboxes.length > 0){
      this.requiredCheckboxTargets.forEach(el => {
        el.required = false;
      });
    } else {
      this.requiredCheckboxTargets.forEach(el => {
        el.required = true;
      });
    }
  }
}