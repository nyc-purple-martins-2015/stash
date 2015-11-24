// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  $('#new_photo').on('click', function(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else {
      alert('Geolocation is not supported on your broswer')
    }

  })

  function showPosition(position) {
    document.getElementById("lat_field").value = position.coords.latitude
    document.getElementById('lng_field').value = position.coords.longitude
  }

  $("#photo_image").on('change',function() {
    if (typeof (FileReader) != "undefined") {

      var photo_preview = $('#photo_preview');
      photo_preview.empty();

      var reader = new FileReader();
      reader.onload = function (e) {
        $("<img />", {
          "src": e.target.result,
          "id": "photo_preview"
        }).appendTo(photo_preview);
      }
      photo_preview.show();
      reader.readAsDataURL($(this)[0].files[0]);
    } else {
      alert("This broswer does not support FileREader.")
    }

  });

  $("#polaroid > figure").on("click", function(event) {
    // debugger
    $(this).toggleClass("#polaroid > figure.back")


  })



});

