import {
    Controller
} from "stimulus"

export default class extends Controller {
    static targets = ["modal", "clinicStaffFields", "testKitsTable"]

    connect() {

    }

    toggleModal(event) {
        let modal = document.getElementById("InventoryNewEntryModal");
        modal.classList.toggle('opacity-0');
        modal.classList.toggle('pointer-events-none');

        this.staffDuplicate();
        this.tableDuplicate();
    }

    staffDuplicate() {
        document.getElementById("clinicStaffFields").innerHTML = this.clinicStaffFieldsTarget.innerHTML;
        document.querySelectorAll('#clinicStaffFields input').forEach((element, index) => {
            element.disabled = true;
            element.nextElementSibling.style.display = 'none';
            element.value = this.clinicStaffFieldsTarget.querySelectorAll('input')[index].value;
        });
    }

    tableDuplicate() {
        document.getElementById('testKitsTable').innerHTML = this.testKitsTableTarget.innerHTML;
        document.querySelectorAll('#testKitsTable .tableActions, #testKitsTable .remove_test_kit_record').forEach(element => {
            element.style.display = 'none';
        });
        document.querySelectorAll('#testKitsTable .new_test_kit_row input, #testKitsTable .new_test_kit_row select').forEach((element, index) => {
            element.disabled = true;
            element.value = this.testKitsTableTarget.querySelectorAll('input, select')[index].value;
        });
    }

    toggleUpdateModal(event) {
        let modal = document.getElementById("InventoryUpdateEntryModal");
        modal.classList.toggle('opacity-0')
        modal.classList.toggle('pointer-events-none')
    }

    updateModalField(e) {
        let currentFieldId = e.currentTarget.id,
            currentFieldValue = e.currentTarget.value;

        document.getElementById("modal_" + currentFieldId).value = currentFieldValue;
    }

    updateModalCheckboxField(e) {
        let currentFieldId = e.currentTarget.id;

        if (e.currentTarget.checked) {
            document.getElementById("modal_" + currentFieldId).checked = true;
        } else {
            document.getElementById("modal_" + currentFieldId).checked = false;
        }
    }

    updateModalRadioField(e) {
        let currentFieldId = e.currentTarget.id,
            radioButtons = document.getElementsByClassName(e.currentTarget.dataset.radio);

        for (var i = 0; i < radioButtons.length; i++) {
            radioButtons[i].checked = false;
        }

        document.getElementById("modal_" + currentFieldId).checked = true;
    }
}
