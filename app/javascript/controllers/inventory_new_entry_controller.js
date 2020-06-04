import {
    Controller
} from "stimulus"

export default class extends Controller {
    static targets = ["modal", "clinicStaffFields", "testKitsTable", "form", "locationModal"]

    connect() {

    }

    formValidity(e) {
      let isValid = this.validateForm(this.formTarget);

      // If the form is invalid, prevent default on the event
      if (!isValid) {
        event.preventDefault();
      } else {
        this.toggleModal();
      }
    }

    validateForm() {
      let isValid = true;

       // Find required fields
      let requiredFieldSelectors = ":required";
      let requiredFields = this.formTarget.querySelectorAll(
        requiredFieldSelectors
      );

      requiredFields.forEach((field) => {
        field.classList.remove("invalid");

        // For each required field, check to see if the value is empty
        if (!field.disabled && !field.value.trim()) {
          field.classList.add("invalid");
          field.parentElement.querySelector(".error-message").classList.remove("hidden");

          isValid = false;
        }
      });

      return isValid;
    }

    validateInputField(event) {
      // Find the error message element
      let errorMessage = event.target.parentNode.getElementsByClassName("error-message")[0];

      // Display error message if value of the input is empty
      if (event.target.value == "") {
        event.target.classList.add("invalid");
        errorMessage.classList.remove("hidden");
      } else {
        event.target.classList.remove("invalid");
        errorMessage.classList.add("hidden");
      }
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
        return;
        let currentFieldId = e.currentTarget.id,
            radioButtons = document.getElementsByClassName(e.currentTarget.dataset.radio);

        for (var i = 0; i < radioButtons.length; i++) {
            radioButtons[i].checked = false;
        }

        document.getElementById("modal_" + currentFieldId).checked = true;
    }
  
    onLocationModal(e) {
      if (e.currentTarget.dataset.value == 'open') this.locationModalTarget.classList.remove('hidden');
      else this.locationModalTarget.classList.add('hidden');
    }
}
