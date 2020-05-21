import {
  Controller
} from "stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {

  }

  updateField() {
    // testing if this works
    refrigerator = document.getElementById("refrigerator");
    refrigerator.querySelector("input").value = "No!!!";
    // textInput = refrigerator.querySelector("input[type=text]");
    // textInput.value = "No";
  }
}