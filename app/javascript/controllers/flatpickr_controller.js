import Flatpickr from 'stimulus-flatpickr'

import '../css/calendar.css'

export default class extends Flatpickr {
    initialize() {
        this.config = {
            altInput: true,
            altFormat: "F j, Y",
            allowInput: true,
            onOpen: function(selectedDates, dateStr, instance) {
                $(instance.altInput).prop('readonly', true);
            },
            onClose: function(selectedDates, dateStr, instance) {
                $(instance.altInput).prop('readonly', false);
                $(instance.altInput).blur();
            }
        }
    }
}