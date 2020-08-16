import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "parent", "children" ]

  connect() {
    this.update();
  }

  update(){
    this.childrenTarget.innerHTML = this.parentTarget[this.parentTarget.selectedIndex].dataset['child-items']
  }
}