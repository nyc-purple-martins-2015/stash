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
});

