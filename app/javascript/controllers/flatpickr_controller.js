import Flatpickr from 'stimulus-flatpickr'

import '../css/calendar.css'

export default class extends Flatpickr {
    initialize() {
        this.config = {
            defaultDate: this.data.get('default-date'),
            altInput: true,
            altFormat: "F j, Y"
        }
    }
}