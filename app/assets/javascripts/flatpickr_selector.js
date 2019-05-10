document.addEventListener('turbolinks:load', function() {
  var el = document.getElementById('flatpickr');
  var datetime = el.getAttribute('datetime');
  flatpickr(el, {
    enableTime: true,
    altInput: true,
    altFormat: 'F j, Y h:i K',
    defaultDate: datetime
  });
});
