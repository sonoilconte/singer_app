document.addEventListener('turbolinks:load', function() {
  console.log('flatpickr sanity')
  var el = document.getElementById('flatpickr');
  flatpickr(el, {
    enableTime: true,
    altInput: true,
    altFormat: 'F j, Y h:i K'
  });
});

// $(document).ready(function() {
//   console.log('flatpickr sanity')
//   var el = document.getElementById('flatpickr');
//   flatpickr(el, {
//     enableTime: true,
//     altInput: true,
//     altFormat: 'F j, Y h:i K'
//   });
// });
