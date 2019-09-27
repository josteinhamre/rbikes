import "bootstrap";
import { toggleDateInputs, dateRangeInputs } from '../plugins/init_flatpickr';
import { selectTab } from '../components/init_tabs'

dateRangeInputs()


document.addEventListener("DOMContentLoaded", function(event) {
  toggleDateInputs();
});

selectTab()


