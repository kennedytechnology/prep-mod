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

  validateFirstName(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "First name is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateLastName(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Last name is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validatePosition(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Position/title is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateAddress1(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Address is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateAddress2(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Unit number/address required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateCity(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "City is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateState(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "State is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateZipCode(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Zip Code is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateOfficePhone(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Office phone is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateMobilePhone(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Mobile phone is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateEmail(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Email address is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  // Validate Backup Contact Inputs
  validateBackupFirstName(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "First name is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupLastName(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];
    
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Last name is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupPosition(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];
    
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Position/title is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupAddress1(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Address is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupAddress2(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText =
        "Unit number/address required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupCity(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "City is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupState(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "State is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupZipCode(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Zip Code is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupOfficePhone(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Office phone is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupMobilePhone(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Mobile phone is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateBackupEmail(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText = "Email address is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateEmployeesNumber(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText =
        "Total number of employees is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }

  validateLocationsNumber(event) {
    let errorMessage = event.target.parentNode.getElementsByClassName(
      "error-message"
    )[0];

    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      errorMessage.classList.remove("hidden");
      errorMessage.innerText =
        "Total number of locations is required!";
    } else {
      event.target.classList.remove("invalid");
      errorMessage.classList.add("hidden");
    }
  }
}
