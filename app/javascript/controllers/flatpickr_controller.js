import Flatpickr from 'stimulus-flatpickr'

import '../css/calendar.css'
const FLATPICKR_CUSTOM_YEAR_SELECT = 'flatpickr-custom-year-select';

export default class extends Flatpickr {
    initialize() {
        this.config = {
            altInput: true,
            altFormat: "F j, Y",
            allowInput: true,
            minDate: "01.01.1920",
            maxDate: "31.12.2049",

            onOpen: function(selectedDates, dateStr, instance) {
                $(instance.altInput).prop('readonly', true);
            },
            onClose: function(selectedDates, dateStr, instance) {
                $(instance.altInput).prop('readonly', false);
                $(instance.altInput).blur();
            },
            onReady: function (selectedDates, dateStr, instance) {
                const flatpickrYearElement = instance.currentYearElement;

                const children = flatpickrYearElement.parentElement.children;
                for (let i in children) {
                    if (children.hasOwnProperty(i)) {
                        children[i].style.display = 'none';
                    }
                }

                const yearSelect = document.createElement('select');
                const minYear = new Date(instance.config._minDate).getFullYear();
                const maxYear = new Date(instance.config._maxDate).getFullYear();
                for (let i = minYear; i <= maxYear; i++) {
                    const option = document.createElement('option');
                    option.value = '' + i;
                    option.text = '' + i;
                    yearSelect.appendChild(option);
                }
                yearSelect.addEventListener('change', function (event) {
                    flatpickrYearElement.value = event.target['value'];
                    instance.currentYear = parseInt(event.target['value']);
                    instance.redraw();
                });

                yearSelect.className = 'flatpickr-monthDropdown-months';
                yearSelect.id = FLATPICKR_CUSTOM_YEAR_SELECT;
                yearSelect.value = instance.currentYearElement.value;

                flatpickrYearElement.parentElement.appendChild(yearSelect);
            },
            onMonthChange: function (selectedDates, dateStr, instance) {
                document.getElementById(FLATPICKR_CUSTOM_YEAR_SELECT).value = '' + instance.currentYear;
            }
        }
    }
}