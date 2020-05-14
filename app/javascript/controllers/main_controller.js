import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "printButton" ];

  connect() {}

  printContent(e) {
    const content = document.getElementById(e.currentTarget.dataset.printcontent);
    window.print();
  }
}
