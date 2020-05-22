import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["locationsCheckboxes", "form"];

  connect() {
    $(document).click(function(e) {
      if (e.target.id != 'predict_company_name' && !$('#locationsCheckboxes').find(e.target).length) {
          $("#locationsCheckboxes").removeClass("active");
      }
    });
  }

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

    // Find checkboxes
    let checkboxScreeningValue = document.getElementById(
      "employer_screening_info"
    ).value;
    let checkboxTestingValue = document.getElementById("employer_testing_info")
      .value;
    let checkboxVaccinationValue = document.getElementById(
      "employer_vacination_info"
    ).value;
    let textareaOtherInfoValue = document.getElementById("employer_other_info")
      .value;

    // If at least one checkbox is checked (value = 1) - form is valid
    if (
      checkboxScreeningValue ||
      checkboxTestingValue ||
      checkboxVaccinationValue ||
      textareaOtherInfoValue
    )
      isValid = true;
    // If none of the checkboxes has value 1 - form is not valid
    else isValid = false;

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
    // Find the error message element
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    // Display error message if value of the input is empty
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");

      // Match the error messages with the appropriate input fields base od input name
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
      // else - Validate the user input when input value is not empty
    } else {
      // Validate zip code input field
      if (
        event.target.name == "employer[zip_code]" ||
        event.target.name == "employer[backup_zip_code]"
      ) {
        let zipCodeRe = /^\d{5}(-\d{4})?$/;
        // Display error message if user's input is not valid
        if (!zipCodeRe.test(event.target.value)) {
          event.target.style.marginBottom = 0;
          errorMessage.classList.remove("hidden");
          errorMessage.innerText = "Incorrect zip code format!";
        } else {
          // Remove error message when the user's input is valid
          event.target.classList.remove("invalid");
          event.target.style.marginBottom = "16px";
          errorMessage.innerText = "";
          errorMessage.classList.add("hidden");
        }
        // Validate phone number input field
      } else if (
        event.target.name == "employer[office_phone]" ||
        event.target.name == "employer[mobile_phone]"
      ) {
        let phoneRe = /^\(?[\d]{3}\)?[\s-]?[\d]{3}[\s-]?[\d]{4}$/;
        // Display error message if user's input is not valid
        if (!phoneRe.test(event.target.value)) {
          event.target.style.marginBottom = 0;
          errorMessage.classList.remove("hidden");
          errorMessage.innerText = "Incorrect phone format!";
        } else {
          // Remove error message when the user's input is valid
          event.target.classList.remove("invalid");
          event.target.style.marginBottom = "16px";
          errorMessage.innerText = "";
          errorMessage.classList.add("hidden");
        }
        // Validate email input field
      } else if (
        event.target.name == "employer[email]" ||
        event.target.name == "employer[backup_email]"
      ) {
        let emailRe = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
        // Display error message if user's input is not valid
        if (!emailRe.test(event.target.value)) {
          event.target.style.marginBottom = 0;
          errorMessage.classList.remove("hidden");
          errorMessage.innerText = "Incorrect email format!";
        } else {
          // Remove error message when the user's input is valid
          event.target.classList.remove("invalid");
          event.target.style.marginBottom = "16px";
          errorMessage.innerText = "";
          errorMessage.classList.add("hidden");
        }
        // Validate number of employees and locations
      } else if (
        event.target.name == "employer[total_employees]" ||
        event.target.name == "employer[total_locations]"
      ) {
        let numberRe = /^[1-9]+[0-9]*$/;
        // Display error message if user's input is not valid
        if (!numberRe.test(event.target.value)) {
          event.target.style.marginBottom = 0;
          errorMessage.classList.remove("hidden");
          errorMessage.innerText = "Please enter a number!";
        } else {
          // Remove error message when the user's input is valid
          event.target.classList.remove("invalid");
          event.target.style.marginBottom = "16px";
          errorMessage.innerText = "";
          errorMessage.classList.add("hidden");
        }
      } else {
        // Remove error message when the input is valid
        event.target.classList.remove("invalid");
        event.target.style.marginBottom = "16px";
        errorMessage.innerText = "";
        errorMessage.classList.add("hidden");
      }
    }
  }
}
