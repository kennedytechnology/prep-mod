import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["locationsCheckboxes"]

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
}