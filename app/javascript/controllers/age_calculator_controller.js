import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "dobField", "ageField" ]

  calculateAge(e){
    var dob = new Date(this.dobFieldTarget.value);
    var today = new Date();
    var age = Math.floor((today-dob) / (365.25 * 24 * 60 * 60 * 1000));
    this.ageFieldTarget.value = age.toString();
  }
}