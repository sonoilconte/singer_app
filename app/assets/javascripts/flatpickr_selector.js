document.addEventListener('turbolinks:load', function() {
  var el = document.getElementById('flatpickr');
  flatpickr(el, {
    enableTime: true,
    altInput: true,
    altFormat: 'F j, Y h:i K'
  });
});
