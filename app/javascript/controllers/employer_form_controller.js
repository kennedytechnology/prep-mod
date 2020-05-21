import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    "locationsCheckboxes",
    "form",
    "firstNameError",
    "lastNameError",
    "positionError",
    "address1Error",
    "address2Error",
    "cityError",
    "stateError",
    "zipCodeError",
    "officePhoneError",
    "mobilePhoneError",
    "emailError",
    "backupFirstNameError",
    "backupLastNameError",
    "backupPositionError",
    "backupAddress1Error",
    "backupAddress2Error",
    "backupCityError",
    "backupStateError",
    "backupZipCodeError",
    "backupOfficePhoneError",
    "backupMobilePhoneError",
    "backupEmailError",
    "employeesNumberError",
    "locationsNumberError",
  ];

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
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.firstNameErrorTarget.classList.remove("hidden");
      this.firstNameErrorTarget.innerText = "First name is required!";
    } else {
      event.target.classList.remove("invalid");
      this.firstNameErrorTarget.classList.add("hidden");
    }
  }

  validateLastName(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.lastNameErrorTarget.classList.remove("hidden");
      this.lastNameErrorTarget.innerText = "Last name is required!";
    } else {
      event.target.classList.remove("invalid");
      this.lastNameErrorTarget.classList.add("hidden");
    }
  }

  validatePosition(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.positionErrorTarget.classList.remove("hidden");
      this.positionErrorTarget.innerText = "Position/title is required!";
    } else {
      event.target.classList.remove("invalid");
      this.positionErrorTarget.classList.add("hidden");
    }
  }

  validateAddress1(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.address1ErrorTarget.classList.remove("hidden");
      this.address1ErrorTarget.innerText = "Address is required!";
    } else {
      event.target.classList.remove("invalid");
      this.address1ErrorTarget.classList.add("hidden");
    }
  }

  validateAddress2(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.address2ErrorTarget.classList.remove("hidden");
      this.address2ErrorTarget.innerText = "Unit number/address required!";
    } else {
      event.target.classList.remove("invalid");
      this.address2ErrorTarget.classList.add("hidden");
    }
  }

  validateCity(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.cityErrorTarget.classList.remove("hidden");
      this.cityErrorTarget.innerText = "City is required!";
    } else {
      event.target.classList.remove("invalid");
      this.cityErrorTarget.classList.add("hidden");
    }
  }

  validateState(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.stateErrorTarget.classList.remove("hidden");
      this.stateErrorTarget.innerText = "State is required!";
    } else {
      event.target.classList.remove("invalid");
      this.stateErrorTarget.classList.add("hidden");
    }
  }

  validateZipCode(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.zipCodeErrorTarget.classList.remove("hidden");
      this.zipCodeErrorTarget.innerText = "Zip Code is required!";
    } else {
      event.target.classList.remove("invalid");
      this.zipCodeErrorTarget.classList.add("hidden");
    }
  }

  validateOfficePhone(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.officePhoneErrorTarget.classList.remove("hidden");
      this.officePhoneErrorTarget.innerText = "Office phone is required!";
    } else {
      event.target.classList.remove("invalid");
      this.officePhoneErrorTarget.classList.add("hidden");
    }
  }

  validateMobilePhone(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.mobilePhoneErrorTarget.classList.remove("hidden");
      this.mobilePhoneErrorTarget.innerText = "Mobile phone is required!";
    } else {
      event.target.classList.remove("invalid");
      this.mobilePhoneErrorTarget.classList.add("hidden");
    }
  }

  validateEmail(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.emailErrorTarget.classList.remove("hidden");
      this.emailErrorTarget.innerText = "Email address is required!";
    } else {
      event.target.classList.remove("invalid");
      this.emailErrorTarget.classList.add("hidden");
    }
  }

  // Validate Backup Contact Inputs
  validateBackupFirstName(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupFirstNameErrorTarget.classList.remove("hidden");
      this.backupFirstNameErrorTarget.innerText = "First name is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupFirstNameErrorTarget.classList.add("hidden");
    }
  }

  validateBackupLastName(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupLastNameErrorTarget.classList.remove("hidden");
      this.backupLastNameErrorTarget.innerText = "Last name is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupLastNameErrorTarget.classList.add("hidden");
    }
  }

  validateBackupPosition(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupPositionErrorTarget.classList.remove("hidden");
      this.backupPositionErrorTarget.innerText = "Position/title is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupPositionErrorTarget.classList.add("hidden");
    }
  }

  validateBackupAddress1(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupAddress1ErrorTarget.classList.remove("hidden");
      this.backupAddress1ErrorTarget.innerText = "Address is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupAddress1ErrorTarget.classList.add("hidden");
    }
  }

  validateBackupAddress2(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupAddress2ErrorTarget.classList.remove("hidden");
      this.backupAddress2ErrorTarget.innerText =
        "Unit number/address required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupAddress2ErrorTarget.classList.add("hidden");
    }
  }

  validateBackupCity(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupCityErrorTarget.classList.remove("hidden");
      this.backupCityErrorTarget.innerText = "City is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupCityErrorTarget.classList.add("hidden");
    }
  }

  validateBackupState(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupStateErrorTarget.classList.remove("hidden");
      this.backupStateErrorTarget.innerText = "State is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupStateErrorTarget.classList.add("hidden");
    }
  }

  validateBackupZipCode(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupZipCodeErrorTarget.classList.remove("hidden");
      this.backupZipCodeErrorTarget.innerText = "Zip Code is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupZipCodeErrorTarget.classList.add("hidden");
    }
  }

  validateBackupOfficePhone(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupOfficePhoneErrorTarget.classList.remove("hidden");
      this.backupOfficePhoneErrorTarget.innerText = "Office phone is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupOfficePhoneErrorTarget.classList.add("hidden");
    }
  }

  validateBackupMobilePhone(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupMobilePhoneErrorTarget.classList.remove("hidden");
      this.backupMobilePhoneErrorTarget.innerText = "Mobile phone is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupMobilePhoneErrorTarget.classList.add("hidden");
    }
  }

  validateBackupEmail(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.backupEmailErrorTarget.classList.remove("hidden");
      this.backupEmailErrorTarget.innerText = "Email address is required!";
    } else {
      event.target.classList.remove("invalid");
      this.backupEmailErrorTarget.classList.add("hidden");
    }
  }

  validateEmployeesNumber(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.employeesNumberErrorTarget.classList.remove("hidden");
      this.employeesNumberErrorTarget.innerText =
        "Total number of employees is required!";
    } else {
      event.target.classList.remove("invalid");
      this.employeesNumberErrorTarget.classList.add("hidden");
    }
  }

  validateLocationsNumber(event) {
    if (event.target.value == "") {
      event.target.style.marginBottom = 0;
      this.locationsNumberErrorTarget.classList.remove("hidden");
      this.locationsNumberErrorTarget.innerText =
        "Total number of locations is required!";
    } else {
      event.target.classList.remove("invalid");
      this.locationsNumberErrorTarget.classList.add("hidden");
    }
  }
}
