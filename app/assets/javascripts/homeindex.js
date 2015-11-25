
$(document).ready(function(){
  $('#start_stash').on("click", function(event){
    event.preventDefault();

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(success);
    } else {
      alert('Geolocation is not supported on your broswer')
    }

    function success(pos) {
      var latitude = pos.coords.latitude
      var longitude = pos.coords.longitude

      window.location = '/home/show?lat='+latitude+'&long='+longitude;
    }


  })


});
