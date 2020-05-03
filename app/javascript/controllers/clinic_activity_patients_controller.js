import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "searchableRow" ]

  showModal(event) {
    let categorySelection = event.target.dataset.selection;
    let patientId = event.target.closest("tr").dataset.patientId
    let modals = this.modalTargets;
    let modal = modals.filter(function(el) {
      return (el.dataset['patientId'] == patientId && el.dataset['categorySelection'] == categorySelection )
    })[0]

    modal.classList.toggle('hidden')

  }

  okModal(event) {
    event.target.closest("tr").setAttribute('data-event-category', event.target.dataset.eventCategory)
    event.target.closest('.modal').classList.toggle('hidden');
  }

  cancelModal(event) {
    // debugger
    let originallySelectedElement = [...event.target.closest("tr").getElementsByTagName("input")].find(element => element.value == event.target.closest('tr').dataset['eventCategory'])
    if(originallySelectedElement) {
      originallySelectedElement.checked = true;
    } else {
      [...event.target.closest("tr").getElementsByTagName("input")].forEach(element => element.checked = false);
    }
    
    event.target.closest('.modal').classList.toggle('hidden');
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
