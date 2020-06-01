import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "searchableRow", "deleteModal", "deleteRecordButton", "cancelModal", "cancelRecordButton" ]

  showModal(event) {
    let categorySelection = event.target.dataset.selection;
    let modals = this.modalTargets;
    let modal = "";

    if (categorySelection == 'AddPatient') {
      modal = document.getElementById('add_patient_modal')
    } else {
      modal = modals.filter(function(el) {
        let patientId = event.target.closest("tr").dataset.patientId
        return (el.dataset['patientId'] == patientId && el.dataset['categorySelection'] == categorySelection )
      })[0]
    } 

    modal.classList.toggle('hidden')
  }

  okModal(event) {
    event.target.closest("tr").setAttribute('data-event-category', event.target.dataset.eventCategory)
    event.target.closest('.modal').classList.toggle('hidden');
  }

  cancelModal(event) {
    // debugger
    if (event.target.dataset['parent'] == 'addMorePatients') {
      event.target.closest('.modal').classList.toggle('hidden');
    } else {
      let originallySelectedElement = [...event.target.closest("tr").getElementsByTagName("input")].find(element => element.value == event.target.closest('tr').dataset['eventCategory'])
      if(originallySelectedElement) {
        originallySelectedElement.checked = true;
      } else {
        [...event.target.closest("tr").getElementsByTagName("input")].forEach(element => element.checked = false);
      }

      event.target.closest('.modal').classList.toggle('hidden');
    }
  }

  search(event) {
    let searchTerm = event.target.value.toLowerCase()
    this.searchableRowTargets.forEach((el, i) => {
      let filterableKey =  el.getAttribute("data-search-content")
      el.classList.toggle("hidden", !filterableKey.includes( searchTerm ) )
    })
  }

  connect() {}

  showHideDeleteModal(e) {
    if (e.currentTarget.text === 'Delete') {
      this.deleteRecordButtonTarget.setAttribute('href', `/${e.currentTarget.dataset.recordis}/${e.currentTarget.dataset.recordid}`);
      document.getElementsByClassName('recordName')[0].innerHTML = e.currentTarget.dataset.recordname;
    }

    this.deleteModalTarget.classList.toggle('hidden');
  }

  onShowHideCancelModal(event) {
    this.cancelModalTarget.classList.toggle('hidden')
    this.cancelRecordButtonTarget.href = `/admin/clinics/${event.currentTarget.dataset.cancelid}`;
  }


}
