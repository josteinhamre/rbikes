import flatpickr from 'flatpickr';
import "flatpickr/dist/flatpickr.min.css"

const toggleDateInputs = function() {

  const startDateInput = document.getElementById('start_date');
  const endDateInput = document.getElementById('end_date');

  if (startDateInput && endDateInput) {

    flatpickr(startDateInput, {
      inline: true,
      minDate: 'today',
      dateFormat: 'd-m-Y',

      onChange: function(selectedDates, selectedDate) {
        if (selectedDate === '') {
          endDateInput.disabled = true;
        }
        let minDate = selectedDates[0];
        minDate.setDate(minDate.getDate() + 1);
        endDateCalendar.set('minDate', minDate);
        endDateInput.disabled = false;
      }
    });
    const endDateCalendar =
    flatpickr(endDateInput, {
      inline: true,
      dateFormat: 'd-m-Y',
      // disable: unvailableDates,
    })

  };
};

const dateRangeInputs = function() {

  const rangeInput = document.getElementById('booking_start_date');
  if (rangeInput) {

    console.log(rangeInput)
    flatpickr(rangeInput, {
      inline: true,
      mode: 'range',
      minDate: 'today',
      dateFormat: 'd-m-Y',
    });
  };
};

export { toggleDateInputs, dateRangeInputs }
