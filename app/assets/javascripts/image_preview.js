var load_file = function(e) {
  var img_tag = document.getElementById('image_preview');
  img_tag.src = URL.createObjectURL(e.target.files[0]);
};
