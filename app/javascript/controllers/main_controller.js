import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "" ];

  connect() { }

  printContent(e) {
    window.print();
  }

  addVaccineDetails(e){ 
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(e.currentTarget).data('id'), 'g');
    $(e.currentTarget).closest('.vaccinated').find('tbody').append($(e.currentTarget).data('fields').replace(regexp, time));
    return event.preventDefault();
  }

  removeVaccineDetails(e) {
    $(e.currentTarget).prev('input[type=hidden]').val('1');
    $(e.currentTarget).closest('.new_vaccine_row').hide();
    return event.preventDefault();
  }
}
