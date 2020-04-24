import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal" ]

  showModal() {
    let modal = document.getElementById("clinic-activity-modal");
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
    window.scrollTo(0, 0);
  }  

  connect() {
    
  }
}
