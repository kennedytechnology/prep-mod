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
    if (event.target.dataset['parent'] == 'addMorePatients') {
      event.target.closest('.modal').classList.toggle('hidden');
    } else {
      event.target.closest('.modal').classList.toggle('hidden');
    }
  }

  updatePatientTable(event) {
    event.preventDefault();
    let radioButton = [...event.target.closest("tr").getElementsByTagName("input")]
        .find(elem => elem.dataset.selection === event.target.dataset.eventCategory),
        closestForm = document.getElementsByClassName(`clinic_event_${event.currentTarget.dataset.clinicEvent}_form`)[0];

    radioButton.checked = true;
    Rails.fire(closestForm, 'submit');
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

  showHideDeleteModal(e) {
    if (e.currentTarget.text === 'Delete') {
      this.deleteRecordButtonTarget.setAttribute('href', `/${e.currentTarget.dataset.recordis}/${e.currentTarget.dataset.recordid}`);
      if (e.currentTarget.dataset.recordis === 'patients') document.getElementsByClassName('recordName')[0].innerHTML = e.currentTarget.dataset.recordname;
    }

    this.deleteModalTarget.classList.toggle('hidden');
  }

  onShowHideCancelModal(event) {
    this.cancelModalTarget.classList.toggle('hidden')
    this.cancelRecordButtonTarget.href = `/clinics/${event.currentTarget.dataset.cancelid}`;
  }
}
