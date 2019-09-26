import "bootstrap";
import { toggleDateInputs } from '../plugins/init_flatpickr';
import { selectTab } from '../components/init_tabs'


document.addEventListener("DOMContentLoaded", function(event) {
  toggleDateInputs();
});

selectTab()
