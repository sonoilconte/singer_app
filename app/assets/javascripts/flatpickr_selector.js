document.addEventListener('turbolinks:load', function() {
  console.log("turbolinks load!");
  var el = document.getElementById('flatpickr');
  var datetime = el.getAttribute('datetime');
  flatpickr(el, {
    enableTime: true,
    altInput: true,
    altFormat: 'F j, Y h:i K',
    defaultDate: datetime
  });
  if (el.nextElementSibling && el.nextElementSibling.nextElementSibling) {
    // flatpickr has injected extra input due to turbolinks, remove extra input sibling
    var extraSibling = el.nextElementSibling.nextElementSibling;
    extraSibling.parentNode.removeChild(extraSibling);
  }
});
