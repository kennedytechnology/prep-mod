import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["number"]
  connect() {
    setInterval(() => {
      var tick_number = parseInt(this.numberTarget.innerHTML.split(",").join(""))
      this.numberTarget.innerHTML = (tick_number - 13).toLocaleString();
    }, 1000)
  }
}