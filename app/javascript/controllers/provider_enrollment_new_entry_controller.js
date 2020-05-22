import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["refrigerator", "refrigerator_text",
    "refrigerator_thermometer", "refrigerator_thermometer_text",
    "freezer", "freezer_text"
  ]

  connect() {}

  fillTextField(e) {
    if (e.currentTarget.id == "provider_enrollment_refrigerator") {
      if (e.currentTarget.checked) {
        this.refrigerator_textTarget.value = "I do not have a refrigerator"
      }
    } else if (e.currentTarget.id == "provider_enrollment_refrigerator_thermometer") {
      if (e.currentTarget.checked) {
        this.refrigerator_thermometer_textTarget.value = "I do not have a refrigerator thermometer"
      }
    } else {
      if (e.currentTarget.checked) {
        this.freezer_textTarget.value = "I do not have a freezer"
      }
    }
  }

}