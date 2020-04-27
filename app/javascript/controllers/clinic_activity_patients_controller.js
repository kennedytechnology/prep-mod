import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "searchableRow" ]

  showModal(event) {
    let modal_id = "clinic-activity-modal-" + event.target.dataset.selection + "-" + event.target.closest("tr").dataset.patientId
    let modal = document.getElementById(modal_id);
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
    // window.scrollTo(0, 0);
  }  

  search(event) {
    let searchTerm = event.target.value.toLowerCase()
    this.searchableRowTargets.forEach((el, i) => {
      let filterableKey =  el.getAttribute("data-search-content")
      el.classList.toggle("hidden", !filterableKey.includes( searchTerm ) )
    })
  }

  connect() {
    
  }
}
