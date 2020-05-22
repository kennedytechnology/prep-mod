import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["locationsCheckboxes", "form"];

  connect() {}

  showCheckboxes() {
    this.locationsCheckboxesTarget.classList.toggle("active");
  }

  submitForm(event) {
    let isValid = this.validateForm(this.formTarget);

    // If our form is invalid, prevent default on the event
    if (!isValid) {
      event.preventDefault();
    }
  }

  validateForm() {
    let isValid = true;

    // Find required fields
    let requiredFieldSelectors = "input:required";
    let requiredFields = this.formTarget.querySelectorAll(
      requiredFieldSelectors
    );

    requiredFields.forEach((field) => {
      field.classList.remove("invalid");
      field.placeholder = "";

      // For each required field, check to see if the value is empty
      if (!field.disabled && !field.value.trim()) {
        field.classList.add("invalid");

        field.placeholder = "Please fill this out!";
        isValid = false;
      }
    });

    return isValid;
  }

  validateInputField(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");

      if (
        event.target.name == "employer[first_name]" ||
        event.target.name == "employer[backup_first_name]"
      ) {
        errorMessage.innerText = "First name is required!";
      } else if (
        event.target.name == "employer[last_name]" ||
        event.target.name == "employer[backup_last_name]"
      ) {
        errorMessage.innerText = "Last name is required!";
      } else if (
        event.target.name == "employer[position]" ||
        event.target.name == "employer[backup_position]"
      ) {
        errorMessage.innerText = "Position/title is required!";
      } else if (
        event.target.name == "employer[address_1]" ||
        event.target.name == "employer[backup_address_1]"
      ) {
        errorMessage.innerText = "Address is required!";
      } else if (
        event.target.name == "employer[address_2]" ||
        event.target.name == "employer[backup_address_2]"
      ) {
        errorMessage.innerText = "Unit number/address 2 is required!";
      } else if (
        event.target.name == "employer[city]" ||
        event.target.name == "employer[backup_city]"
      ) {
        errorMessage.innerText = "City is required!";
      } else if (
        event.target.name == "employer[state]" ||
        event.target.name == "employer[backup_state]"
      ) {
        errorMessage.innerText = "State is required!";
      } else if (
        event.target.name == "employer[zip_code]" ||
        event.target.name == "employer[backup_zip_code]"
      ) {
        errorMessage.innerText = "Zip Code is required!";
      } else if (event.target.name == "employer[office_phone]") {
        errorMessage.innerText = "Office phone is required!";
      } else if (event.target.name == "employer[mobile_phone]") {
        errorMessage.innerText = "Mobile phone is required!";
      } else if (
        event.target.name == "employer[email]" ||
        event.target.name == "employer[backup_email]"
      ) {
        errorMessage.innerText = "Email address is required!";
      } else if (event.target.name == "employer[total_employees]") {
        errorMessage.innerText = "Total number of employees is required!";
      } else if (event.target.name == "employer[total_locations]") {
        errorMessage.innerText = "Total number of locations is required!";
      } else {
        event.target.classList.remove("invalid");
        errorMessage.classList.add("hidden");
      }
    }
  }
}
