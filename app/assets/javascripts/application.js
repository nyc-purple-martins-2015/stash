// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require handlebars-205c61c


$(document).ready(function() {
// autocomplete place details

  (function initialize (){
    var defaultLatLng = new google.maps.LatLng(40.7127, -74.0059)

    //show current location
    if ( navigator.geolocation ) {
      function success(pos) {
        drawMap(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
      }
      function fail(error) {
          drawMap(defaultLatLng);
      }
        navigator.geolocation.getCurrentPosition(success, fail, {maximumAge: 500000, enableHighAccuracy:true, timeout: 6000});
      } else {
        drawMap(defaultLatLng);  // No geolocation support, show default map
    }

    //function to make a map and drop a pin
    function drawMap(latlng) {
      var myOptions = {
        zoom: 18,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("map"), myOptions);

      var marker = new google.maps.Marker({
          position: latlng,
          map: map,
      });
    // autofill function
      var input = document.getElementById('searchTextField');
      console.log(input);

      var autocomplete = new google.maps.places.Autocomplete(input);

      autocomplete.bindTo('bounds', map);
      var infowindow = new google.maps.InfoWindow();

      autocomplete.addListener('place_changed', function() {
          infowindow.close();
          var place = autocomplete.getPlace();
          $('#photo_restaurant').val(place.name);

          console.log(place);
      });
    }


}) ();


//document ready end
});
