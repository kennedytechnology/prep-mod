import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "parent", "children" ]

  connect() {
    this.update();
  }

  update(){
    this.childrenTarget.innerHTML = this.parentTarget[this.parentTarget.selectedIndex].attributes['data-child-items'].value;
    document.getElementsByClassName('vaccineSelect')[0].innerHTML = this.parentTarget[this.parentTarget.selectedIndex].attributes['data-vaccine-items'].value;
    this.updateRowDetails.updateDetails();
  }

  get updateRowDetails() {
    let supplyInventoriesDetails = document.getElementById('supplyInventoriesDetails');
    return this.application.getControllerForElementAndIdentifier(supplyInventoriesDetails, 'habtm-form');
  }
}
